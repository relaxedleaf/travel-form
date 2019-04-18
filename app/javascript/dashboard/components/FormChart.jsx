import React from 'react';
import ReactChartkick, { PieChart } from 'react-chartkick';
import Chart from 'chart.js';
import axios from 'axios';

ReactChartkick.addAdapter(Chart)

export default class FormChart extends React.Component {
    state = {
        statuses: [],
        num: []
      };

    componentDidMount = () => {
        var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/api/allstatus')
        .then(function (response) {
            self.setState({statuses: response.data.statuses})
            self.setState({num: response.data.num})
            
        })
        .catch(function (error) {
            console.log(error);
        });
    };

    render = () => {
        if(this.state.statuses.length != 0 && this.state.num.length !=0){
            console.log(this.state.statuses);
            return(

            <PieChart data={
                            [[this.state.statuses[0], this.state.num[0]],
                                [this.state.statuses[1], this.state.num[1]],
                                [this.state.statuses[2], this.state.num[2]],
                                [this.state.statuses[3], this.state.num[3]],
                                [this.state.statuses[4], this.state.num[4]]]
                            } />
            )}

        else{
            return <div>Loading...</div>
        }      
    
    };
}