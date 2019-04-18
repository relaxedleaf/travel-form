import React from 'react';
//import ReactChartkick, { ColumnChart, PieChart } from 'react-chartkick';
//import Chart from 'chart.js';
//import axios from 'axios';
 import piechart from "./components/PieChart"
 import deptgraph from "./components/DeptGraph"
    
export default class App extends React.Component {
    render = () => {
        return (
         
            <div>
                <PieChart name="Your Forms" />
  
                <DeptGraph name="Dept Approvals" />
            </div>

        )
    };
}