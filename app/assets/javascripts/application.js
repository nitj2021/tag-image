// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
    var tag_id,xx,yy,x,y,off_set_left,off_set_top;
    var new_tag_id = 0;
    if ($("#create_tag").length > 0) {
        off_set_left = $("#create_tag").offset().left;
        off_set_top = $("#create_tag").offset().top;
        var all_tags = document.getElementsByClassName('tags');
        for (var k = 0; k < all_tags.length; k++) {
            var xxx = all_tags[k].offsetLeft + off_set_left;
            var yyy = all_tags[k].offsetTop + off_set_top;
            $(all_tags[k]).attr("style", "top: " + yyy + "px;left: " + xxx + "px;")
        }
    }
    $("#add_new_photo").click(function (e) {

        $("#add_pic_here").append("<input id=picture_" + new_tag_id + " name=picture_" + new_tag_id + " type=file /><br/>")
        new_tag_id += 1;
        $("#total_uploads").attr("value", new_tag_id)
        e.preventDefault();
    });
    $("#tag_text").keyup(function (e) {
        var tag_name = $.trim($("#tag_text").attr('value'))
        if (e.keyCode == 13 && tag_name != "") {
            $("#tag_text").attr("style", "display:none")
            $("#to_add_new_tags").append("<span class=tags id=highlight_tag_x" + new_tag_id + " >" + tag_name + "</span>");
            $("#add_tag_name").append(" <label class = tags_name id=tag_x" + new_tag_id + " >" + tag_name + "</label>")
            $("#highlight_tag_x" + new_tag_id).attr("style", "position:absolute;top: " + y + "px;left: " + x + "px;opacity: 0.0;");
            var photo_id = $("#id").attr('value')
            new_tag_id += 1
            $.ajax({url:'/photo/create_tag?tag=' + tag_name + "&id=" + photo_id + "&x_cord=" + xx + "&y_cord=" + yy,async: false,cache:false,success:function(data) {
            }})
        }
    });
    $("#create_tag").click(function (e) {
        var img = document.getElementById('create_tag');
        var width = this.clientWidth;
        var height = this.clientHeight;
        xx = e.pageX - off_set_left;
        yy = e.pageY - off_set_top;
        x = e.pageX;
        y = e.pageY;
        if ((x + 140) > width) {
            x = width - 140;
            xx = x - $(this).offset().left;
        }
        if ((y) > (height + $("#create_tag").offset().top - 25)) {
            y = height + $("#create_tag").offset().top - 25;
            yy = y - off_set_top;
        }
        $("#tag_text").attr("value", "");

        $("#tag_text").attr("style", "position:absolute;top: " + y + "px;left: " + x + "px;display: inline;");
        $("#tag_text").focus();

    });
    $('.tags').live('mouseenter', function() {

        $(this).css('opacity', '1.0');

    });
    $('.tags').live('mouseleave', function() {

        $(this).css('opacity', '0.0');
    });
    $('.tags_name').live('mouseenter', function() {
        tag_id = $(this).attr("id").split('_')[1];

        $("#highlight_tag_" + tag_id).css('opacity', '1.0');
        $(this).css('opacity', '1.0');
    });
    $('.tags_name').live('mouseleave', function() {
        $("#highlight_tag_" + tag_id).css('opacity', '0.0');
        $(this).css('opacity', '0.5');
    });
    $("#save_new_album").click(function (e) {
        var result = dup_name()
        if (result == false) {
            e.preventDefault();
        }

    });
    function dup_name() {

        var album_name = $.trim($('#album_name').attr('value'));
        if (album_name == "") {
            alert("please Enter Name");
            return false;
        }

        else {
            var value;
            $.ajax({url:'/album/dup_album_name?name=' + album_name,async:false,success:function(data) {

                value = data
                if (value == 'yes') {
                    alert('Sorry, album name  ' + album_name + '  has already been taken.');
                }
            }});
            if (value == 'yes') {
                return false;
            }
        }
    }


});