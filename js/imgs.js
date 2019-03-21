//$(function () {
//    $("#clkBtn a").attr("href", "#");
//    $("#clkBtn a").each(function (index) {
//        $(this).click(function () {
//            changeImage(this, index);
//        });
//    });
//    autoChangeImage();
//});

//function autoChangeImage() {
//    for (var i = 0; i <= 10000; i++) {
//    /* 设置图片跳转的时间i */
//        setTimeout("clkBtn(" + (i % 5 + 1) + ")", i * 2000);
//    }
//}

//function clkBtn(index) {
//    $("#clkBtn a:nth-child(" + index + ")").click();
//}

//function changeImage(element, index) {
//    var arryImgs = ["images/1.jpg", "images/2.jpg", "images/3.jpg", "images/4.jpg", "images/5.jpg"];
//    $("#clkBtn a").removeClass("active");
//    $(element).addClass("active");
//    $("#pics img").attr("src", arryImgs[index]);
//}