// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
    onYukleme();
    $.preloadCssImages();

});

function onYukleme() {
    $(document).append(new Image().src = '/assets/images/gritter/error_128.png');
    $(document).append(new Image().src = '/assets/images/gritter/checkmark_128.png');
    $(document).append(new Image().src = '/assets/images/gritter/warning_128.png');

    var browser = $.browser;
    if (browser.mozilla || browser.webkit || browser.opera) {
        $snd = new Audio("/assets/images/master/notice.ogg");
    } else if (browser.safari || browser.msie) {
        $snd = new Audio("/assets/images/master/notice.mp3");
    }
    $(document).append($snd);

    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/bottom-left.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/bottom-middle.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/bottom-right.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/middle-left.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/middle-right.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/tail-bottom.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/tail-left.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/tail-right.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/tail-top.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/top-left.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/top-middle.png');
    $(document).append(new Image().src = '/assets/images/bubblepopup/theme/violet/top-right.png');
}


function bubble(nesne, metin) {
    var bubbleOption = {themePath:'assets/images/bubblepopup/theme', themeName:'violet', position:'right'};
    nesne.CreateBubblePopup($.extend(bubbleOption, { innerHtml:metin}));
}


$.extend($.gritter.options, {
    position:'bottom-left', // defaults to 'top-right' but can be 'bottom-left', 'bottom-right', 'top-left', 'top-right' (added in 1.7.1)
    fade_in_speed:'medium', // how fast notifications fade in (string or int)
    fade_out_speed:2000, // how fast the notices fade out
    time:3000, // hang on the screen for...
    sticky:false
});

function gritter(type, title, metin) {


    if (type == 'alert') {
        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:title,
            // (string | mandatory) the text inside the notification
            text:metin,
            // (string | optional) the image to display on the left
            image:'/assets/images/gritter/warning_128.png'

        });
        $snd.play();
    } else if (type == 'notice') {
        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:title,
            // (string | mandatory) the text inside the notification
            text:metin,
            // (string | optional) the image to display on the left
            image:'/assets/images/gritter/checkmark_128.png'
        });


    }
    else if (type == 'error') {
        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:title,
            // (string | mandatory) the text inside the notification
            text:metin,
            // (string | optional) the image to display on the left
            image:'/assets/images/gritter/error_128.png'
        });
        $snd.play();

    }
    else if (type == 'timeout') {
        $.gritter.add({
            // (string | mandatory) the heading of the notification
            title:title,
            // (string | mandatory) the text inside the notification
            text:metin,
            // (string | optional) the image to display on the left
            image:'/assets/images/gritter/error_128.png',
            sticky:true
        });

    }
}

