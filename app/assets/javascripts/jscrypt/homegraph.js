    var datas = document.getElementById("demochartline");
    var datas1 = document.getElementById("demochartline1");
    var datas2 = document.getElementById("demochartline2");


    var min = document.getElementById("minval");
    var max = document.getElementById("maxval");

    var min1 = document.getElementById("minval1");
    var max1 = document.getElementById("maxval1");

    var min2 = document.getElementById("minval2");
    var max2 = document.getElementById("maxval2");

    console.log(datas);
    console.log(max2);
    console.log(min2);


    min = min.innerHTML;
    max = max.innerHTML;

    min1 = min1.innerHTML;
    max1 = max1.innerHTML;

    min2 = min2.innerHTML;
    max2 = max2.innerHTML;

    datas = datas.innerHTML;
    datas1 = datas1.innerHTML;
    datas2 = datas2.innerHTML;


    min = JSON.parse(min);
    max = JSON.parse(max);

    min1 = JSON.parse(min1);
    max1 = JSON.parse(max1);

    min2 = JSON.parse(min2);
    max2 = JSON.parse(max2);

    datas = JSON.parse(datas);
    datas1 = JSON.parse(datas1);
    datas2 = JSON.parse(datas2);


if (document.getElementById("flot-line-chart0") && document.getElementById("demochartline")) {
$(function() {
    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.2
                    }, {
                        opacity: 0.2
                    }]
                }
            }
        },
        xaxis: {

            mode: 'time',
            unit: 'day',




        },
        yaxis: {
            tickDecimals: 2,
            min: min - ((max - min)/3),
            max: max + ((max - min)/3)
        },
        colors: ["#0073ff"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false,
            position: "sw"
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y",

        }
    };


    var barData = {
        label: "BTC/EUR Kraken",
        tickDecimals: 2,
        data: datas,

    };
    $.plot($("#flot-line-chart0"), [barData], barOptions);

});

}
if (document.getElementById("flot-line-chart1") && document.getElementById("demochartline1")) {
$(function() {
    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.2
                    }, {
                        opacity: 0.2
                    }]
                }
            }
        },
        xaxis: {
            mode: 'time',




        },
        yaxis: {
            tickDecimals: 2,
            min: min1 - ((max1 - min1)/3),
            max: max1 + ((max1 - min1)/3)
        },
        colors: ["#0073ff"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false,
            position: "sw"
        },
        tooltip: {
    tooltip: true
},
        tooltipOpts: {
            xDateFormat: '%H:%M',
            content: "x: %x, y: %y"
        }
    };


    var barData = {
        label: "ETH/EUR Gdax",
        tickDecimals: 2,
        data: datas1,

    };
    $.plot($("#flot-line-chart1"), [barData], barOptions);

});
}

if (document.getElementById("flot-line-chart2") && document.getElementById("demochartline2")) {
$(function() {
    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.2
                    }, {
                        opacity: 0.2
                    }]
                }
            }
        },
        xaxis: {
            mode: 'time',
            unit: 'day',

        },
        yaxis: {
            tickDecimals: 2,
            min: min2 - ((max2 - min2)/3),
            max: max2 + ((max2 - min2)/3)
        },
        colors: ["#0073ff"],
        grid: {
            color: "#999999",
            hoverable: true,
            clickable: true,
            tickColor: "#D4D4D4",
            borderWidth:0
        },
        legend: {
            show: false,
            position: "sw"
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y"
        }
    };


    var barData = {
        label: "LTC/EUR Bitstamp",
        tickDecimals: 2,
        data: datas2,

    };
    $.plot($("#flot-line-chart2"), [barData], barOptions);

});
}
