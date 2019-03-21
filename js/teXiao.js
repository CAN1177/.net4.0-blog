//调用 Javascript显示时间
function T() {
    var t = new Date();
    var y = t.getFullYear();
    var M = t.getMonth()+1;
    var d = t.getDate();
    var h = t.getHours();
    var m = t.getMinutes();
    var s = t.getSeconds();
    var week = new Array(7);
    week[0] = "星期天";
    week[1] = "星期一";
    week[2] = "星期二";
    week[3] = "星期三";
    week[4] = "星期四";
    week[5] = "星期五";
    week[6] = "星期六";
    var w = week[t.getDay()];
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    $("#time").html(y + "年" + M + "月" + d + "日&nbsp;" + h + "：" + m + "：" + s +"&nbsp;"+ w);
    t = setTimeout('T()', 500);
}
function checkTime(i) {
    if (i < 10)
    { i = "0" + i }
    return i
}
