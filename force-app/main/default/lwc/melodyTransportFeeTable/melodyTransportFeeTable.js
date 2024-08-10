import { LightningElement, track } from 'lwc';
export default class MelodyTransportFeeTable extends LightningElement {

     @track data = [
        { id: '1', from: 'International City', to: 'Business Bay', cost: 500 },
        { id: '2', from: 'Silicon Oasis', to: 'Business Bay', cost: 400 },
        { id: '3', from: 'Internatinal City', to: 'DIP 1', cost: 600 },
        { id: '4', from: 'Internatinal City', to: 'DIP 2', cost: 650 },
        { id: '5', from: 'Silicon Oasis', to: 'DIP 1', cost: 500 },
        { id: '6', from: 'Silicon Oasis', to: 'DIP 1', cost: 550 },
        { id: '7', from: 'Internatinal City', to: 'Sheikh Zayed Road', cost: 600 },
        { id: '8', from: 'Silicon Oasis', to: 'Sheikh Zayed Road', cost: 500 }
    ];

    @track columns = [
        { label: 'From', fieldName: 'from', type: 'text' },
        { label: 'To', fieldName: 'to', type: 'text' },
        { label: 'Cost', fieldName: 'cost', type: 'currency' }
    ];
}