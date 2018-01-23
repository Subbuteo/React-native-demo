import moment from 'moment';

var api = {

  

  getWeather(){

    var nowTime = (new Date()).valueOf();
    var date2 = Math.floor(nowTime - (24 * 3600 * 1000));
    console.log(moment(date2).format("YYYY/MM/DD"));
    var str_date = moment(date2).format("YYYY/MM/DD").toString();
    var url = 'https://www.metaweather.com/api/location/1100661/' + str_date;
    return fetch(url, {method: 'GET'}).then((res)=>res.json());

  }
};

module.exports = api;