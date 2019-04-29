import React from 'react';
import PieChart from "./FormChart"
import DeptGraph from "./DeptGraph"
import axios from 'axios';
    
export default class App extends React.Component {
    state = {
        empName: ""
    };

    componentDidMount = () => {
        var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/api/getEmpName')
          .then(function (response) {
              self.setState({empName: response.data.empName})
          })
          .catch(function (error) {
            console.log(error);
          });
    };

    render = () => {
        return (
            <div>
                <h2>Welcome back to your dashboard, {this.state.empName} !</h2>
                
                <div class="row">
                    <div class="col-xl-9 col-lg-7">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Your Forms</h6>
                            </div>

                            <div class="card-body">
                                <PieChart  />
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-8 col-lg-7">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Department Approval Rates</h6>
                            </div>

                            <div class="card-body">
                                <DeptGraph />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        )
    };
}