document.addEventListener('turbolinks:load', function() {
    if (!document.getElementById("countdown")) {
        return;
    }

    // Update the count down every 1 second
    let x = setInterval(function(){
        let time_left_el = document.getElementById("countdown");

        // decrease time left value
        let time_left = parseFloat(time_left_el.dataset.timeleft);
        time_left--
        time_left_el.dataset.timeleft = time_left;

        // Time calculations for days, hours, minutes and seconds
        let days    = Math.floor(time_left / (60 * 60 * 24));
        let hours   = Math.floor((time_left % (60 * 60 * 24)) / (60 * 60));
        let minutes = Math.floor((time_left % (60 * 60)) / 60);
        let seconds = Math.floor(time_left % 60);

        // Display the result in the element with id="countdown"
        time_left_el.textContent = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        // If the count down is finished, write some text
        if (time_left <= 0) {
            clearInterval(x);
            time_left_el.textContent = "EXPIRED";
            document.getElementsByTagName("form")[0].submit();
        }
    }, 1000);
});
