import { Controller } from 'stimulus'
import Rails from '@rails/ujs'

export default class extends Controller {
  create(event) {
    event.preventDefault()
    this.submitForm(event.currentTarget)
  }

  update(event) {
    this.submitForm(event.currentTarget)
  }

  submitForm(form) {
    Rails.ajax({
      type: form.method,
      url: form.action,
      data: new FormData(form),
      success: (data) => {
        this.element.outerHTML = data.to_dos
      }
    })
  }
}
