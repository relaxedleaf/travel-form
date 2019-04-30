import React from 'react';
import axios from 'axios';

export default class ExpensiveTrips extends React.Component {
    state = {
        trips: []
    };

    componentDidMount = () => {
        var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/api/getExpensiveDest')
            .then(function (response) {
                self.setState({ trips: response.data.expensiveDest })
                    .catch(function (error) {
                        console.log(error);
                    });
            });
    }


    render = () => {

        if (this.state.trips.length != 0) {
            console.log(this.state.trips);
            trips.sort((a, b) => (a.date_start > b.date_start) ? 1 : -1)
            return (
                <div>

                    
                
                </div>
            )}

        else {
            return <div>Loading...</div>
        }

    };
}
