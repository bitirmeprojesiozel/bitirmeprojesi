/**
 * Created by JetBrains RubyMine.
 * User: sems
 * Date: 12/24/11
 * Time: 11:42 AM
 * To change this template use File | Settings | File Templates.
 * jquery gritter plugin bağımlılığı vardır.
 * Jquert ui.core  bağımlılığı vardır.
 *
 */
(function($) {
    $.fn.gunceller = function(path, model, field) {
        $(this).each(function() {
            $(this).data(gunceller_core($(this).attr("name"), $(this), path, model, field))
        })

    }
})(jQuery);

function gunceller_core(id, txtbox, path, model, field) {
    var eskiRenk = txtbox.css("background-color");
    var eskiDeger = $(txtbox).val();
    txtbox.bind("drop", function() {
        setTimeout(function() {
            txtbox.change();
        }, 0)
    });

    txtbox.keyup(function(event) {
        if (eskiDeger != $(txtbox).val()) {
            $(txtbox).animate({backgroundColor: '#FFF973'}, 100);
        } else {
            $(txtbox).animate({backgroundColor: eskiRenk}, 100);
        }
    });

    txtbox.change(function() {
        var postData = {};
        var postData1 = {};
        postData1[field] = $(this).val();
        postData[model] = postData1;

        $.ajax({
            type: 'PUT',
            url: "/"+path + "/" + id  ,
            dataType: "json",
            data: postData,
            complete:function(xhr) {

                switch (xhr.status) {

                    case 200:
                        renk = "#67E46F";
                        durum = true;
                        eskiDeger = $(txtbox).val();
                        break;

                    case 422:
                        renk = "#FF7673";
                        durum = false;
                        eskiDeger = $(txtbox).val();
                        var hata_metni = "";
                        hata_metni += 'Yapamıyorum, Lütfen bir yardımcı olsanız, bursluyum ben.</br>'
                        $.each(jQuery.parseJSON(xhr.responseText), function(key, val) {
                            hata_metni += key + ' ' + val + "</br>";
                        });

                        $.gritter.add({
                            title: 'Yapamıyorum, Olmuyooor!',
                            image: '/assets/gritter/usta.jpg',
                            time: 6000,
                            text:  hata_metni
                        });
                        break;

                    default:
                        renk = "#FF7673";
                        durum = false;
                        eskiDeger = $(txtbox).val();
                        var hata_metni = "";
                        hata_metni += 'Sistem hatası.</br>';

                        $.gritter.add({
                            title: 'Yapamıyorum, Olmuyooor!',
                            image: '/assets/gritter/usta.jpg',
                            time: 6000,
                            text:  hata_metni
                        });

                        break;
                }


                $(txtbox).animate({
                    backgroundColor: renk
                }, 500, function() {
                    if (durum)
                        $(txtbox).animate({backgroundColor: eskiRenk}, 500);

                });
            }
        });

    });

}
