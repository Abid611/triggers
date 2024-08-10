import { LightningElement,track } from 'lwc';
export default class MelodySuggestionDataTable extends LightningElement {

   @track suggestions = [
        { id: '1', suggestion: 'Improve customer service', status: 'Open' },
        { id: '2', suggestion: 'Enhance product features', status: 'Closed' },
        { id: '3', suggestion: 'Expand support hours', status: 'Open' }
    ];

    
    actions = [
        { label: 'Delete', name: 'delete' }
    ];

    @track columns = [
        { label: 'Suggestion', fieldName: 'suggestion', type: 'text', editable: true },
        { label: 'Status', fieldName: 'status', type: 'text' },
        { type: 'action', typeAttributes: { rowActions: '$actions' } }
    ];

    addNewRecord() {
        const newId = String(this.suggestions.length + 1);
        this.suggestions = [...this.suggestions, { id: newId, suggestion: '', status: '' }];
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const rowId = event.detail.row.id;
        if (actionName === 'delete') {
            this.suggestions = this.suggestions.filter(suggestion => suggestion.id !== rowId);
        }
    }

   
}