document.addEventListener('turbolinks:load', function(){
  let control = document.getElementById('progress-bar')

  if (control) {
    showProgress(control)
  }
})

function showProgress(control) {
  let progress = control.dataset.progress
  
  control.getAttribute('aria-valuenow', progress)
  control.style.width = progress + '%'
}