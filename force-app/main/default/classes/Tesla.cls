public with sharing class Tesla extends Auth.AuthProviderPluginClass {
    
    public String redirectUrl;
    private static String customMetadataTypeApiName = 'carcloud__Tesla_Auth_Provider_Settings__mdt';
    

    public String getCustomMetadataType()
    {
        return customMetadataTypeApiName;
    }
    public Auth.UserData getUserInfo(Map<String,String> authProviderConfiguration, Auth.AuthProviderTokenResponse response)
    {
        return null;
    }
    public Auth.AuthProviderTokenResponse handleCallback(Map<String,String> authProviderConfiguration, Auth.AuthProviderCallbackState callbackState)
    {
        return null;
    }

    public System.PageReference initiate(Map<String,String> authProviderConfiguration, String stateToPropagate)
    {
        PageReference initiatePageReference = new PageReference('https://google.com/lightning/cmp/carcloud__TeslaLoginContainer');
        initiatePageReference.getParameters().put('c__client_id', authProviderConfiguration.get('carcloud__Client_Id__c'));
        initiatePageReference.getParameters().put('c__client_secret', authProviderConfiguration.get('carcloud__Client_Secret__c'));
        initiatePageReference.getParameters().put('c__redirect_uri', redirectUrl);
        return initiatePageReference;
    }
    /*public override Auth.OAuthRefreshResult refresh(Map<String,String> authProviderConfiguration, String refreshToken)
    {
        return null;
    }*/








}
