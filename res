<!DOCTYPE html>

<html>

<head>

    <meta charset="utf-8">



    <style>
        .outer_face {

            position: relative;

            width: 200px;
            /* width of clock */

            height: 200px;
            /* height of clock */

            border-radius: 200px;
            /* clock round corner radius */

            background: white;

            box-shadow: inset 0 0 10px gray;

            border: 0 solid gray;
            /* thickness of outer border */

        }



        .outer_face::before,
        .outer_face::after,
        .outer_face .marker {
            /* time markers syle */

            content: "";

            position: absolute;

            width: 8px;
            /* width of 12-6 and 3-9 markers */

            height: 100%;

            background: black;

            z-index: 0;

            left: 50%;

            margin-left: -4px;
            /* set this value of 1/2 marker width */

            top: 0
        }



        .outer_face::after {

            -moz-transform: rotate(90deg);

            -ms-transform: rotate(90deg);

            -webkit-transform: rotate(90deg);

            transform: rotate(90deg)
        }



        .outer_face .marker {

            background: gray;

            width: 6px;
            /* width of all other markers */

            margin-left: -3px
                /* set this value of 1/2 marker width */

        }



        .outer_face .marker.oneseven {

            -moz-transform: rotate(30deg);

            -ms-transform: rotate(30deg);

            -webkit-transform: rotate(30deg);

            transform: rotate(30deg)
        }



        .outer_face .marker.twoeight {

            -moz-transform: rotate(60deg);

            -ms-transform: rotate(60deg);

            -webkit-transform: rotate(60deg);

            transform: rotate(60deg)
        }



        .outer_face .marker.fourten {

            -moz-transform: rotate(120deg);

            -ms-transform: rotate(120deg);

            -webkit-transform: rotate(120deg);

            transform: rotate(120deg)
        }



        .outer_face .marker.fiveeleven {

            -moz-transform: rotate(150deg);

            -ms-transform: rotate(150deg);

            -webkit-transform: rotate(150deg);

            transform: rotate(150deg)
        }



        .inner_face {

            position: relative;

            width: 88%;

            height: 88%;

            background: white;

            -moz-border-radius: 1000px;

            -webkit-border-radius: 1000px;

            border-radius: 1000px;

            z-index: 1000;

            left: 6%;
            /* set this value of 1/2 width value*/

            top: 6%
                /* set this value of 1/2 height value*/

        }



        .inner_face::before {

            /* clock center circle small */

            content: "";

            width: 18px;
            /* width of inner circle */

            height: 18px;
            /* height of inner circle */

            border-radius: 18px;

            margin-left: -9px;
            /* set this value of 1/2 width value*/

            margin-top: -9px;
            /* set this value of 1/2 height value*/

            background: black;

            position: absolute;

            top: 50%;

            left: 50%;

            box-shadow: 0 0 30px blue;

        }



        .inner_face::after {

            content: "QUARTZ";

            position: absolute;

            width: 100%;

            font: normal 0.8em Arial;

            color: gray;

            text-align: center;

            top: 85%
        }



        .hand,
        .hand.hour {

            position: absolute;

            width: 4px;
            /* width of hour hand */

            height: 30%;
            /* height of hour hand */

            top: 20%;
            /* set top to 50% - height */

            left: 50%;

            margin-left: -2px;
            /* set this value to 1/2 width */

            background: black;

            -moz-transform: rotate(0deg);

            -ms-transform: rotate(0deg);

            -webkit-transform: rotate(0deg);

            transform: rotate(0deg);

            -moz-transform-origin: bottom;

            -ms-transform-origin: bottom;

            -webkit-transform-origin: bottom;

            transform-origin: bottom;

            z-index: -1;

            -moz-box-shadow: 0 0 3px gray;

            -webkit-box-shadow: 0 0 3px gray;

            box-shadow: 0 0 3px gray
        }



        .hand.minute {

            height: 45%;
            /* height of min hand */

            top: 5%;
            /* set top to 50% - height */

            width: 5px;
            /* width of min hand */

            margin-left: -2.5px;
            /* set this value to 1/2 width */

        }



        .hand.second {

            height: 50%;
            /* height of sec hand */

            width: 2px;
            /* width of sec hand */

            margin-left: -1px;
            /* set this value to 1/2 width */

            top: 0;

            background: red
        }
    </style>

</head>



<body>



    <div id="liveclock" class="outer_face">

        <div class="marker oneseven"></div>

        <div class="marker twoeight"></div>

        <div class="marker fourten"></div>

        <div class="marker fiveeleven"></div>



        <div class="inner_face">

            <div class="hand hour"></div>

            <div class="hand minute"></div>

            <div class="hand second"></div>

        </div>

    </div>





    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>



    <script>

        var $hands = $('#liveclock div.hand')



        window.requestAnimationFrame = window.requestAnimationFrame

            || window.mozRequestAnimationFrame

            || window.webkitRequestAnimationFrame

            || window.msRequestAnimationFrame

            || function (f) { setTimeout(f, 60) }





        function updateclock() {

            var curdate = new Date()

            var hour_as_degree = (curdate.getHours() + curdate.getMinutes() / 60) / 12 * 360

            var minute_as_degree = curdate.getMinutes() / 60 * 360

            var second_as_degree = (curdate.getSeconds() + curdate.getMilliseconds() / 1000) / 60 * 360

            $hands.filter('.hour').css({ transform: 'rotate(' + hour_as_degree + 'deg)' })

            $hands.filter('.minute').css({ transform: 'rotate(' + minute_as_degree + 'deg)' })

            $hands.filter('.second').css({ transform: 'rotate(' + second_as_degree + 'deg)' })

            requestAnimationFrame(updateclock)

        }



        requestAnimationFrame(updateclock)

    </script>



</body>

</html>
