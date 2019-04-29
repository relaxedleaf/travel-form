import React from 'react';
import ReactChartkick, { ColumnChart } from 'react-chartkick';
import Chart from 'chart.js';
import axios from 'axios';

ReactChartkick.addAdapter(Chart)

export default class DeptGraph extends React.Component {
    state = {
        depts: [],
        num: []
      };

    componentDidMount = () => {
        var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/api/deptApproveRate')
        .then(function (response) {
            self.setState({depts: response.data.depts})
            self.setState({num: response.data.num})
            
        })
        .catch(function (error) {
            console.log(error);
        });
    };

    render = () => {
        if(this.state.depts.length != 0 && this.state.num.length !=0){
            console.log(this.state.depts);
            return(

            <ColumnChart data={
                            [[this.state.depts[0], this.state.num[0]],
                                [this.state.depts[1], this.state.num[1]],
                                [this.state.depts[2], this.state.num[2]]]
                            } />
            )}

        else{
            return <div>Loading...</div>
        }      
    
    };
}