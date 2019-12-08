import { LightningElement, track, wire, api } from 'lwc';
import login from '@salesforce/apex/TeslaLoginController.login';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';


export default class TeslaLogin extends NavigationMixin(LightningElement) {
    @track messageFromImperative = '';
    @api
    getQueryParams() {
        var params = {};
        var search = location.search.substring(1);
        if (search) {
            params = JSON.parse('{"' + search.replace(/&/g, '","').replace(/=/g, '":"') + '"}', (key, value) => {
                return key === "" ? value : decodeURIComponent(value)
            });
        }
        return params;
    }




    handleClick(event) {
        login({ username: '$username', password:'$password', clientId: this.getQueryParams()['c__client_id'], clientSecret: this.getQueryParams()['c__client_secret'] })
        .then(result => { this.messageFromImperative = result });
    }
}