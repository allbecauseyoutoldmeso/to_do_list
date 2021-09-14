import { Controller } from 'stimulus'
import Rails from '@rails/ujs'

export default class extends Controller {
  static targets = ['createForm']

  create(event) {
    event.preventDefault()
    const form_data = new FormData(this.createFormTarget)

    Rails.ajax({
      type: 'post',
      url: 'to_dos',
      data: form_data,
      success: (data) => {
        this.element.outerHTML = data.list
      }
    })
  }
}
