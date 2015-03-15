window.onload = function() {
    document.getElementById("submit").onclick = function() { 
        makeRequest(document.getElementById("search").value); 
        startProgressBar();
    };

}

function startProgressBar() {
    var node = document.getElementById("bar");
    node.style.visibility = "visible";
    setInterval(function () {
    //    var node = document.getElementById("bar");
        node.style.width = Math.random() * 100 + "px";
    }, 500);
}

function stopProgressBaar() {
    var node = document.getElementById("bar");
    node.style.visibility = "hidden";
}

function makeRequest(url) {
    var API_URL = "http://ai.minghe.me/url";
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
      httpRequest = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
      try {
        httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
      } 
      catch (e) {
        try {
          httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        } 
        catch (e) {}
      }
    }

    if (!httpRequest) {
      alert('Giving up :( Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = alertContents;
    httpRequest.open('POST', API_URL, true);
    httpRequest.send('{"url":' + '"' + url + '"}'); 
}

function alertContents() {
    if (httpRequest.readyState === 4) {
        if (httpRequest.status === 200) {
        var pieData = []; 
        var data = JSON.parse(httpRequest.responseText);
        var colors = randomColor({
           count: 10,
           hue: 'green'
        });
        for (var i = 0; i < data.length; i++) {
            var tmp = {};
            tmp.value = parseInt(data[i].value);
            tmp.label = data[i].key;
            tmp.color = colors[i];
            pieData.push(tmp);
        }

        var pieOptions = {
            segmentShowStroke : true,
            animateScale : true,
        };

        var countries= document.getElementById("myChart").getContext("2d");
        new Chart(countries).Pie(pieData, pieOptions);
        stopProgressBaar();
        } else {
            alert('There was a problem with the request.');
        }
    }
}
