// var from = document.getElementById("promotion_from").innerHTML
// var to = document.getElementById("promotion_to").innerHTML
// var range = moment().range(from, to);


$(function(){

from = $("#promotion_from").val()
to = $("#promotion_to").val()


console.log(from)  

if(new Date(from) < new Date()){

    CountDownTimer(to, 'countdown');
}

// console.log(range)

    function CountDownTimer(dt, id)
    {
        var end = new Date(dt);

        var _second = 1000;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;
        var timer;

        function showRemaining() {
            var now = new Date();
            var distance = end - now;
            if (distance < 0) {

                clearInterval(timer);
                document.getElementById(id).innerHTML = 'THIS OFFER HAS NOW ENDED!';

                return;
            }

            var days = Math.floor(distance / _day);
            var hours = Math.floor((distance % _day) / _hour);
            var minutes = Math.floor((distance % _hour) / _minute);
            var seconds = Math.floor((distance % _minute) / _second);

            document.getElementById(id).innerHTML = days + ' Days ';
            document.getElementById(id).innerHTML += hours + ' Hours ';
            document.getElementById(id).innerHTML += minutes + ' Mins ';
            document.getElementById(id).innerHTML += seconds + ' Secs';
        }

        timer = setInterval(showRemaining, 1000);
    }
    })
