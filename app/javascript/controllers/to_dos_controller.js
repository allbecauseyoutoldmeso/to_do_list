import { Controller } from 'stimulus'
import Rails from '@rails/ujs'

export default class extends Controller {
  create(event) {
    event.preventDefault()
    this.submit_form(event.currentTarget)
  }

  update(event) {
    this.submit_form(event.currentTarget)
  }

  submit_form(form) {
    Rails.ajax({
      type: form.method,
      url: form.action,
      data: new FormData(form),
      success: (data) => {
        this.element.outerHTML = data.list
      }
    })
  }
}
