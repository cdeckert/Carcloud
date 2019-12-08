public with sharing class TeslaLoginController {
    public TeslaLoginController() {

    }
    @AuraEnabled(cacheable=true)
    public static String login(String username, String password, String clientId, String clientSecret)
    {
        return 'result' + clientId;
    }
}
