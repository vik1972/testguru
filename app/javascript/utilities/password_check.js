document.addEventListener('turbolinks:load', function () {
    let password = document.querySelector('.check-password')
    let passwordConfirm = document.querySelector('.confirm-password')

    if (password && passwordConfirm) { passwordConfirm.addEventListener('input', passwordCheck) }

});

function passwordCheck() {
  let password = document.querySelector('.check-password')
  let passwordConfirm = document.querySelector('.confirm-password')
  
  if(passwordConfirm.classList.contains('border-red')){
    passwordConfirm.classList.remove('border-red')
  }

  if(passwordConfirm.classList.contains('border-green')){
    passwordConfirm.classList.remove('border-green')
  }

  if(passwordConfirm.value === ''){
    document.querySelector('.text-success').classList.add('hide')
    document.querySelector('.text-danger').classList.add('hide')
    return
  } if (password.value == passwordConfirm.value) {
      passwordConfirm.classList.add('border-green')
      showSuccessIcon()
    } else {
        passwordConfirm.classList.add('border-red')
        showDangerIcon()
      }
}

function showSuccessIcon() { 
  if (document.querySelector('.text-success').classList.contains('hide')) {
    document.querySelector('.text-success').classList.remove('hide')
    document.querySelector('.text-danger').classList.add('hide')
  }
}

function showDangerIcon() {
  if (document.querySelector('.text-danger').classList.contains('hide')) {
    document.querySelector('.text-danger').classList.remove('hide')
    document.querySelector('.text-success').classList.add('hide')
  }
}
