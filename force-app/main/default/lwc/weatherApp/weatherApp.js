import { LightningElement, track } from 'lwc';
import getWeatherData from '@salesforce/apex/OpenWeatherMapService.getWeatherData';

export default class WeatherApp extends LightningElement {
    @track city;
    @track temperature;
    @track description;
    @track humidity;
    @track hasWeatherData = false;

    handleCityChange(event) {
        this.city = event.target.value;
    }

    handleGetWeather() {
        getWeatherData({ city: this.city })
            .then(result => {
                console.log('result is: ', result);
                this.hasWeatherData = true;
                this.temperature = result.temperature;
                //this.description = result.condition;
                this.description = 'abc';   
                this.city = result.city;
                this.humidity = result.humidity;
            })
            .catch(error => {
                console.error('Error fetching weather data:', error);
            });
    }
}