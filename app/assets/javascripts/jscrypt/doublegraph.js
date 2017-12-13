    var settitle = document.getElementById("titleplat");

    var cryptosname = document.getElementById("cryptosname");
    cryptosname = cryptosname.innerHTML;
    cryptosname = JSON.parse(cryptosname);


    var minmax = document.getElementById("minmax");
    minmax = minmax.innerHTML;
    minmax = JSON.parse(minmax);



    var platname = document.getElementById("platname");
    platname = platname.innerHTML;
    platname = JSON.parse(platname);


    var plat = document.getElementById("allcompactfav");
   plat = plat.innerHTML;
   plat = JSON.parse(plat);

   var carddash = document.getElementsByClassName("card-dashbord-favorite1");

      settitle.innerHTML = cryptosname[0][0] + " (" + cryptosname[0][1] + ")";
      datas = plat[1][0];
       datas1 = plat[1][1];
       $(function() {


           var oilprices = datas
           var exchangerates = datas1

           function euroFormatter(v, axis) {
               return v.toFixed(axis);
           }

           function doPlot(position) {

               $.plot($("#flot-line-chart-multi00"), [{
                   data: datas,
                   fill: true,
                   label: platname[0][0]
               }, {
                   data: datas1,
                   fill: true,


                   label: platname[0][1],

               }], {
                   series: {
                       lines: {
                           show: true,
                           lineWidth: 2,
                           fill: true,
                           fillColor: {
                               colors: [{
                                   opacity: 0.3
                               }, {
                                   opacity: 0.3
                               }]

                           }
                       }
                   },
                   xaxes: [{
                       mode: 'time',
                       unit: 'day',
                   }],
                   yaxes: [{
                       tickDecimals: 2,
                       min: minmax[0][0] - (minmax[0][1] - minmax[0][0]),
                       max: minmax[0][1] + (minmax[0][1] - minmax[0][0])

                   }, {
                       // align if we are to the right
                       alignTicksWithAxis: position == "right" ? 1 : null,
                       position: position,
                       tickFormatter: euroFormatter
                   }],
                   legend: {
                       position: 'sw'
                   },
                   colours: ["#60f305"],
                   grid: {
                       color: "#999999",
                       hoverable: true,
                       clickable: true,
                       tickColor: "#D4D4D4",
                       borderWidth: 0,
                       hoverable: true //IMPORTANT! this is needed for tooltip to work,

                   },
                   tooltip: true,
                   tooltipOpts: {
                       content: "x: %x  y: %y",

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

   carddash[0].addEventListener("click", function() {
       settitle.innerHTML = cryptosname[0][0] + " (" + cryptosname[0][1] + ")";
       datas = plat[0][0];
       datas1 = plat[0][1];

       $(function() {


           var oilprices = datas
           var exchangerates = datas1

           function euroFormatter(v, axis) {
               return v.toFixed(axis);
           }

           function doPlot(position) {

               $.plot($("#flot-line-chart-multi00"), [{
                   data: datas,
                   fill: true,
                   label: platname[0][0]
               }, {
                   data: datas1,
                   fill: true,


                   label: platname[0][1],

               }], {
                   series: {
                       lines: {
                           show: true,
                           lineWidth: 2,
                           fill: false,
                           fillColor: {
                               colors: [{
                                   opacity: 0.3
                               }, {
                                   opacity: 0.3
                               }]

                           }
                       }
                   },
                   xaxes: [{
                       mode: 'time',
                       unit: 'day',
                   }],
                   yaxes: [{
                       tickDecimals: 2,
                       min: minmax[0][0] - (minmax[0][1] - minmax[0][0]),
                       max: minmax[0][1] + (minmax[0][1] - minmax[0][0])

                   }, {
                       // align if we are to the right
                       alignTicksWithAxis: position == "right" ? 1 : null,
                       position: position,
                       tickFormatter: euroFormatter
                   }],
                   legend: {
                       position: 'sw'
                   },
                   colours: ["#60f305"],
                   grid: {
                       color: "#999999",
                       hoverable: true,
                       clickable: true,
                       tickColor: "#D4D4D4",
                       borderWidth: 0,
                       hoverable: true //IMPORTANT! this is needed for tooltip to work,

                   },
                   tooltip: true,
                   tooltipOpts: {
                       content: "x: %x  y: %y",

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




   });


if (carddash.length > 1){
   carddash[1].addEventListener("click", function() {
       settitle.innerHTML = cryptosname[1][0] + " (" + cryptosname[1][1] + ")";
       datas = plat[1][0];
       datas1 = plat[1][1];

       $(function() {


           var oilprices = datas
           var exchangerates = datas1

           function euroFormatter(v, axis) {
               return v.toFixed(axis);
           }

           function doPlot(position) {

               $.plot($("#flot-line-chart-multi00"), [{
                   data: datas,
                   fill: false,
                   label: platname[1][0]
               }, {
                   data: datas1,
                   fill: true,


                   label: platname[1][1],

               }], {
                   series: {
                       lines: {
                           show: true,
                           lineWidth: 2,
                           fill: false,
                           fillColor: {
                               colors: [{
                                   opacity: 0.3
                               }, {
                                   opacity: 0.3
                               }]

                           }
                       }
                   },
                   xaxes: [{
                       mode: 'time',
                       unit: 'day',
                   }],
                   yaxes: [{
                       tickDecimals: 2,
                       min: minmax[1][0] - (minmax[1][1] - minmax[1][0]),
                       max: minmax[1][1] + (minmax[1][1] - minmax[1][0])

                   }, {
                       // align if we are to the right
                       alignTicksWithAxis: position == "right" ? 1 : null,
                       position: position,
                       tickFormatter: euroFormatter
                   }],
                   legend: {
                       position: 'sw'
                   },
                   colours: ["#60f305"],
                   grid: {
                       color: "#999999",
                       hoverable: true,
                       clickable: true,
                       tickColor: "#D4D4D4",
                       borderWidth: 0,
                       hoverable: true //IMPORTANT! this is needed for tooltip to work,

                   },
                   tooltip: true,
                   tooltipOpts: {
                       content: "x: %x  y: %y",

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




   });
 }

   if (carddash.length > 2){
   carddash[2].addEventListener("click", function() {
       settitle.innerHTML = cryptosname[2][0] + " (" + cryptosname[2][1] + ")";
       datas = plat[2][0];
       datas1 = plat[2][1];

       $(function() {


           var oilprices = datas
           var exchangerates = datas1

           function euroFormatter(v, axis) {
               return v.toFixed(axis);
           }

           function doPlot(position) {

               $.plot($("#flot-line-chart-multi00"), [{
                   data: datas,
                   fill: true,
                   label: platname[2][0]
               }, {
                   data: datas1,
                   fill: true,


                   label: platname[2][1],

               }], {
                   series: {
                       lines: {
                           show: true,
                           lineWidth: 2,
                           fill: false,
                           fillColor: {
                               colors: [{
                                   opacity: 0.3
                               }, {
                                   opacity: 0.3
                               }]

                           }
                       }
                   },
                   xaxes: [{
                       mode: 'time',
                       unit: 'day',
                   }],
                   yaxes: [{
                       tickDecimals: 2,
                       min: minmax[2][0] - (minmax[2][1] - minmax[2][0]),
                       max: minmax[2][1] + (minmax[2][1] - minmax[2][0])

                   }, {
                       // align if we are to the right
                       alignTicksWithAxis: position == "right" ? 1 : null,
                       position: position,
                       tickFormatter: euroFormatter
                   }],
                   legend: {
                       position: 'sw'
                   },
                   colours: ["#60f305"],
                   grid: {
                       color: "#999999",
                       hoverable: true,
                       clickable: true,
                       tickColor: "#D4D4D4",
                       borderWidth: 0,
                       hoverable: true //IMPORTANT! this is needed for tooltip to work,

                   },
                   tooltip: true,
                   tooltipOpts: {
                       content: "x: %x  y: %y",

                       onHover: function(flotItem, $tooltipEl) {
                       }
                   }
               });
           }
           doPlot("right");
           $("button").click(function() {
               doPlot($(this).text());
           });
       });
   });
 }



