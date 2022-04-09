document.addEventListener ('turbolinks:load', function(){
  const timerField = document.getElementById('timer')

    if (timerField) {
        const timerValue = timerField.dataset.timer
        let timerFinish = new Date(timerValue).getTime()
        let delay = 1000
        setInterval(changeTimerValue, delay, timerField, timerFinish)
    }
})

function changeTimerValue(timerField, timerFinish) {
    let timeNow = new Date().getTime()
    let timeRemain = timerFinish - timeNow

    let minutes = Math.floor((timeRemain / (1000 * 60)) % 60)
    let seconds = Math.floor((timeRemain % (1000 * 60)) / 1000)

    minutes = checkTime(minutes)
    seconds = checkTime(seconds)

    timerField.textContent = minutes + ":" + seconds

    if (timeRemain <= 0) {
        timerField.textContent = "00:00"

        const form = document.querySelector('.testpassage-form');
        const testpassageId = form.dataset.testpassageId;

        document.querySelector('.testpassage-form[data-testpassage-id="' + testpassageId + '"]').submit();
        
    }
}

function checkTime(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}