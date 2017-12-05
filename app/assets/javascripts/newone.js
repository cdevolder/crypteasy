$.getScript('//cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.min.js',function(){
  $.getScript('//cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.pie.min.js',function(){
    $.getScript('//cdnjs.cloudflare.com/ajax/libs/flot/0.8.2/jquery.flot.resize.min.js',function(){


            // static charts
      var d1x = [6,8,1,40,23,67,70,22,13,16,43,1,14,13,54,25,0,12,11,45,21]
      var val = document.getElementById('testarr');
      console.log(val.innerHTML)
      var d1 = [];
      val = val.innerHTML;
      val = JSON.parse(val);
      var z = 0;
      for (var i = 0; i < val.length; i += 1) {

          //console.log(val[i]);
          d1.push([i, Math.round(parseInt(val[z]))]);
          console.log(Math.round(parseInt(val[z])));
          z += 1;

        }

      var d2 = [[0, 3], [4, 8], [8, 5], [9, 13]];
      var d3 = [[2012, 12], [2015, 12], [2018, 13]];


      // line
      $.plot("#chart2",[d1],{xaxis:{show:true},yaxis:{show:true},grid:{borderColor:'#ccc'}});
      $.plot("#chart3",[d2,d3],{yaxis:{show:false},grid:{borderColor:'#ccc'},series:{color:'#ff4444',lines:{show:true},points:{show:true}}});
      $.plot("#chart4",[d3],{yaxis:{show:true},grid:{borderColor:'#ccc'},series:{color:'#4444ff'}});


      // we use an inline data source in the example, usually data would
      // be fetched from a server
      var data = [], totalPoints = 800;
      function getRandomData() {

        if (data.length > 0)
          data = data.slice(1);

        // do a random walk
        while (data.length < totalPoints) {
          var prev = data.length > 0 ? data[data.length - 1] : 50;
          var y = prev + Math.random() * 10 - 5;
          if (y < 0)
            y = 0;
          if (y > 100)
            y = 100;
          data.push(y);
        }

        // zip the generated y values with the x values
        var res = [];
        for (var i = 0; i < data.length; ++i)
          res.push([i, data[i]])
          return res;
      }

      // setup control widget
      var updateInterval = 200;
      $("#updateInterval").val(updateInterval).change(function () {
      var v = $(this).val();
      if (v && !isNaN(+v)) {
        updateInterval = +v;
        if (updateInterval < 1)
            updateInterval = 1;
            if (updateInterval > 2000)
             updateInterval = 2000;
             $(this).val("" + updateInterval);
            }
      });

      // setup plots
      var options = {
        grid:{borderColor:'#ccc'},
        series:{shadowSize:0,color:"#33ff33"},
        yaxis:{min:0,max:100},
        xaxis:{show:true}
      };

      var plot = $.plot($("#chart1"), [ getRandomData() ], options);

      function update() {
        plot.setData([ getRandomData() ]);
        plot.draw();
        setTimeout(update, updateInterval);
      }

      update();

    });// end getScript (resize)
  });// end getScript (pie)
});// end getScript
