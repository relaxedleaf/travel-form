import React from 'react';
import ReactChartkick, { LineChart, PieChart } from 'react-chartkick';
import Chart from 'chart.js';
import axios from 'axios';

ReactChartkick.addAdapter(Chart)
    
export default class App extends React.Component {    
  state = {
    statuses: [],
    num:[]
  };
  
  componentDidMount = () => {


    axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.get('/api/allstatus')
      .then(function (response) {
        console.log(response.data);
      })
      .catch(function (error) {
        console.log(error);
      });
  };

  render = () => {
    return(
        <PieChart data={[["Blueberry", 44], ["Strawberry", 23]]} />
        
    )
  };
}