window.onload = function() {
    document.getElementById("submit").onclick = function() { 
        makeRequest(document.getElementById("search").value); 
    };
}

function makeRequest(url) {
    var API_URL = "http://localhost:9292/url";
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
            document.getElementById("result").innerHTML = httpRequest.responseText;
        } else {
            alert('There was a problem with the request.');
        }
    }
}
