document.addEventListener('turbolinks:load', function() {
    let current = document.querySelector('.current_question');
    let total = document.querySelector('.total_questions');

    if (!current || !total){
        return null;
    }

    current = current.innerText;
    total   = total.innerText;

    let progress = Math.round((current - 1) / total * 10);

    const progress_bar = document.querySelectorAll('.progress-item');

    if (progress_bar.length) {
        for (var i = 0; i < progress; i++) {
            progress_bar[i].classList.add('green');
            progress_bar[i].classList.remove('yellow');
        }
    }

});
