# Generated with Microsoft365DSC version 1.22.126.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]
    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.22.126.1'

    Node localhost
    {
        SPOTenantSettings a3dc2b51-c466-4718-b5f9-cf0bb3a98db3
        {
            ApplyAppEnforcedRestrictionsToAdHocRecipients = $True;
            ConditionalAccessPolicy                       = "AllowFullAccess";
            Credential                                    = $Credscredential;
            FilePickerExternalImageSearchEnabled          = $True;
            HideDefaultThemes                             = $False;
            IsSingleInstance                              = "Yes";
            LegacyAuthProtocolsEnabled                    = $True;
            MarkNewFilesSensitiveByDefault                = "AllowExternalSharing";
            MaxCompatibilityLevel                         = "15";
            MinCompatibilityLevel                         = "15";
            NotificationsInSharePointEnabled              = $True;
            OfficeClientADALDisabled                      = $False;
            OwnerAnonymousNotification                    = $True;
            PublicCdnAllowedFileTypes                     = "CSS,EOT,GIF,ICO,JPEG,JPG,JS,MAP,PNG,SVG,TTF,WOFF";
            PublicCdnEnabled                              = $False;
            SearchResolveExactEmailOrUPN                  = $False;
            SignInAccelerationDomain                      = "";
            UseFindPeopleInPeoplePicker                   = $False;
            UsePersistentCookiesForExplorerView           = $False;
            UserVoiceForFeedbackEnabled                   = $True;
        }
    }
}
M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
