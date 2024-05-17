import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [
        'searchForm',
        'searchField',
        'submitButton',
        'searchPreview'
    ]

    initialize() {
        console.log('search initialize')
    }
  
    connect() {
        console.log('search connect')
    }

    searchPreviewTargetConnected(element) {
        console.log('searchPreviewTargetConnected');
    
        if (this.searchFieldTarget.value.length >= 3) {
          const link = document.createElement('a');
    
          link.href =
            this.searchFormTarget.action +
            '?search=' +
            this.searchFieldTarget.value;
    
          link.innerText = 'Смотреть всё';
    
          this.searchPreviewTarget.appendChild(link);
        }
      }

    GetData() {
        console.log(
            'search',
            this.searchFieldTarget.value,
            this.searchFieldTarget.value.length >= 3
        );

        if (this.searchFieldTarget.value.length >= 3) {
            // Turbo.navigator.submitForm(this.searchFormTarget);
            this.submitButtonTarget.click();

            // const frame = this.searchPreviewTarget;
            // const self = this;

            // frame.loaded.then(
            //     function (success) {
            //         console.log('success')  
            //     },
            //     function (error) {
            //         console.log('error')  
            //     }
            // );
        }
    }
}