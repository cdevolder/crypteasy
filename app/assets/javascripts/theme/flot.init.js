//Flot Bar Chart

    var datas = gon.alltimevalues;
    var datas1 = gon.alltimevalues1;

    var min = gon.min;
    var max = gon.min;

    console.log(datas);
    min = min.innerHTML;
    max = max.innerHTML;
    datas = datas.innerHTML;
    datas1 = datas1.innerHTML;

    min = JSON.parse(min);
    max = JSON.parse(max);
    datas = JSON.parse(datas);
    datas1 = JSON.parse(datas1);
    console.log(datas);
    console.log(datas1);
    console.log(min);
    console.log(max);
$(function() {
    var barOptions = {
        series: {
            lines: {
                show: true,
                lineWidth: 2,
                fill: true,
                fillColor: {
                    colors: [{
                        opacity: 0.0
                    }, {
                        opacity: 0.0
                    }]
                }
            }
        },
        xaxis: {
            tickDecimals: 0,
            mode: 'time'
        },
        yaxis: {
            tickDecimals: 2,
            min: min - 5.0,
            max: max + 5.0
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
            show: true,
            position: "nw"
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y"
        }
    };


    var barData = {
        label: "Kraken/Bitcoin",
        tickDecimals: 2,
        data: datas,

    };
    $.plot($("#flot-line-chart"), [barData], barOptions);

});
//Flot Pie Chart


$(function() {

    var container = $("#flot-line-chart-moving");

    // Determine how many data points to keep based on the placeholder's initial size;
    // this gives us a nice high-res plot while avoiding more than one point per pixel.

    var maximum = container.outerWidth() / 2 || 300;

    //

    var data = [];

    function getRandomData() {

        if (data.length) {
            data = data.slice(1);
        }

        while (data.length < maximum) {
            var previous = data.length ? data[data.length - 1] : 50;
            var y = previous + Math.random() * 10 - 5;
            data.push(y < 0 ? 0 : y > 100 ? 100 : y);
        }

        // zip the generated y values with the x values

        var res = [];
        for (var i = 0; i < data.length; ++i) {
            res.push([i, data[i]]);
        }

        return res;
    }

    series = [{
        data: getRandomData(),
        lines: {
            fill: true
        }
    }];


    var plot = $.plot(container, series, {
        grid: {

            color: "#999999",
            tickColor: "#D4D4D4",
            borderWidth:0,
            minBorderMargin: 20,
            labelMargin: 10,
            backgroundColor: {
                colors: ["#ffffff", "#ffffff"]
            },
            margin: {
                top: 8,
                bottom: 20,
                left: 20
            },
            markings: function(axes) {
                var markings = [];
                var xaxis = axes.xaxis;
                for (var x = Math.floor(xaxis.min); x < xaxis.max; x += xaxis.tickSize * 2) {
                    markings.push({
                        xaxis: {
                            from: x,
                            to: x + xaxis.tickSize
                        },
                        color: "#fff"
                    });
                }
                return markings;
            }
        },
        colors: ["#0073ff"],
        xaxis: {
            tickFormatter: function() {
                return "";
            }
        },
        yaxis: {
            min: 0,
            max: 110
        },
        legend: {
            show: true
        }
    });

    // Update the random dataset at 25FPS for a smoothly-animating chart

    setInterval(function updateRandom() {
        series[0].data = getRandomData();
        plot.setData(series);
        plot.draw();
    }, 40);

});

//Flot Multiple Axes Line Chart
$(function() {
    var oilprices = datas
    var exchangerates = datas1

    function euroFormatter(v, axis) {
        return v.toFixed(axis);
    }

    function doPlot(position) {
        $.plot($("#flot-line-chart-multi"), [{
            data: oilprices,
            label: "Oil price ($)"
        }, {
            data: exchangerates,
            label: "USD/EUR exchange rate",

        }], {
            xaxes: [{
                mode: 'time'
            }],
            yaxes: [{
              min: 10500,
              max: 11500
            }, {
                // align if we are to the right
                alignTicksWithAxis: position == "right" ? 1 : null,
                position: position,
                tickFormatter: euroFormatter
            }],
            legend: {
                position: 'sw'
            },
            colors: ["#0073ff"],
            grid: {
                color: "#999999",
                hoverable: true,
                clickable: true,
                tickColor: "#D4D4D4",
                borderWidth:0,
                hoverable: true //IMPORTANT! this is needed for tooltip to work,

            },
            tooltip: true,
            tooltipOpts: {
                content: "%s for %x was %y",
                xDateFormat: "%y-%0m-%0d",

                onHover: function(flotItem, $tooltipEl) {
                    // console.log(flotItem, $tooltipEl);
                }
            }

        });
    }

    doPlot("right");

    $("button").click(function() {
        doPlot($(this).text());
    });
});



