document.addEventListener('turbolinks:load', function() {
    if (!document.getElementById("countdown")) {
        return;
    }

    let time_left = parseFloat(document.getElementById("countdown").dataset.timeleft);

    // Set the date we're counting down to
    let countDownDate = new Date();
    countDownDate.setSeconds(countDownDate.getSeconds() + time_left);

    // Update the count down every 1 second
    let x = setInterval(function() {
        // Get todays date and time
        let now = new Date().getTime();

        // Find the distance between now and the count down date
        let distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        let days = Math.floor(distance / (1000 * 60 * 60 * 24));
        let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the result in the element with id="countdown"
        document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        // If the count down is finished, write some text
        if (distance <= 0) {
            clearInterval(x);
            document.getElementById("countdown").textContent = "EXPIRED";
            document.getElementsByTagName("form")[0].submit();
        }
    }, 1000);
});
