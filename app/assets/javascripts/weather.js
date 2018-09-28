(function(){
    var url = "http://api.openweathermap.org/data/d5./weather?q=Seattle,Washington";
    var apiKey = "edabaa9eae71d3a54440bfa6b77f367c";
    var httpRequest;
    makeRequest();

    function makeRequest(){
        
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = responseMethod();
        httpRequest.open('GET', url + '&appid=' + apiKey);
        httpRequest.send();
    }

    function responseMethod(){
        if(httpRequest.readyState === 4){
            if(httpRequest.status === 200){
                updateUISuccess(httpRequest.responseText);
            
            }else {
                updateUIError();
            }
        }
    }

    function updateUISuccess(responseText){
        var response = JSON.parse(httpRequest.responseText);
        var condition = response.weather[0].main;
        var degC = response.main.temp - 273.15;
        var degCInt = Math.floor(degC);
        var degF = degC * 1.8 + 32;
        var degFInt = Math.floor(degF);
        var weatherBox = document.getElementById("weather");
        weatherBox.innerHTML = "<p> + degCInt + "&#176; C /" + degFInt + "&#176; F </p><p>" + condition + </p>";

    }
    function updateUIError(){
        var weatherBox = document.getElementById("weather");
        weatherBox.className = "hidden";
    }
})();