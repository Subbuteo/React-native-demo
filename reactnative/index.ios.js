'user strict'
import React, { Component } from 'react';
import {
  AppRegistry,
  ScrollView,
  StyleSheet,
  Text,
  ListView,
  View,
  NavigatorIOS,
  NativeModules
} from 'react-native';


import {
  Cell,
  Section,
  TableView
} from 'react-native-tableview-simple';

import api from './api';

var leth = 1;
//var URL = 'https://www.metaweather.com/api/location/1100661/';

function _renderRow(item){
  return (
    <View style={styles.row}>
      <View>
        <Text>Weather State : {item.weather_state_name}</Text>
        <Text>MAX TEMP: {item.max_temp}</Text>
        <Text>MIN TEMP: {item.min_temp}</Text>
        <Text>WIND : {item.wind_direction_compass}</Text>
        <Text>WIND SPEED: {item.wind_speed}</Text>
        <Text>HUMIDITY : {item.humidity}</Text>
        <Text>PREDICTABILITY :{item.predictability}</Text>
        <Text>DATE : {item.applicable_date}</Text>
      </View>
    </View>
  );

}

function _renderHeader(){
  return (
    <View>
      <View></View>
      <Text> Brisbane Weather List</Text>
      <View></View>
    </View>
  );
}

function _renderSepartor(sectionId, rowId) {
  
  return (
    <View style={styles.separator}
      key={sectionId + rowId}></View>
  );
}

export default class App extends Component<{}> {
  constructor(props){
    super(props);
    var ds = new ListView.DataSource({
      rowHasChanged:(oldRow, newRow) => oldRow !== newRow
    });
    this.state = {
      loaded: false,
      //weather:[],
      dataSource :ds,
      
    };
  }
  
  componentDidMount(){
    this.getData();
  }



  getData(){
    api.getWeather().then(responseData =>{
      // console.log(responseData);
      this.setState({
        loaded:true,
        dataSource:this.state.dataSource.cloneWithRows(responseData)
      });

    });
  }

  // componentDidMount(){
  //   api.getWeather().then(responseData => {
  //     console.log(responseData);
  //     // leth = Object.keys(responseData).length;
  //     // console.log(leth);
  //     this.setState({
  //       weather: responseData,
  //       loaded:true,
  //     });
  //   });
  // }

  render(){
    if (!this.state.loaded) {
      return this.renderLoadingView();
    }
    /*return(//after update
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Weather: {this.state.weather.length}
        </Text>
        <Text style={styles.instructions}>
        </Text>
      </View>

    );*/
    return(
      <ListView
        style ={styles.listView}
        dataSource={this.state.dataSource}
        renderRow={_renderRow}
        renderHeader={_renderHeader}
        renderSeparator = {_renderSepartor}
        initialListSize ={10}
      />
    );

  }
  renderLoadingView() {
    return (
      <View style={styles.loadingContainer}>
        <Text style={styles.loadingText} > Loading weather ...... </Text>
        {/*<Text style={styles.welcome}>
          Weather: Loading ...
        </Text>
        <Text style={styles.instructions}>
        </Text>*/}
      </View>
    );
  }
};



const styles = StyleSheet.create({
  loadingContainer: {
    flex: 1,
    marginTop: 0,
    backgroundColor: "cyan",
    justifyContent: "center",
    alignItems: "center"
  },    

  loadingText: {
    fontSize: 30,
    fontWeight: "bold",
    textAlign: "center",
    marginLeft: 10
    , marginRight: 10
  },   

  listView: {
    marginTop: 0,
    backgroundColor: "#F5FCFF"
  },
  row: {
    flexDirection: "row",
    padding: 30,
    alignItems: "center",
    backgroundColor: "#F5FCFF"
  },
  separator: {
    height: 1,
    backgroundColor: "black"
  }
});

// var styles = StyleSheet.create({
//   container: {
//     flex: 1,
//     flexDirection: 'row',
//     justifyContent: 'center',
//     alignItems: 'center',
//     backgroundColor: '#F5FCFF',
//   },
// });

AppRegistry.registerComponent('App', () => App);  