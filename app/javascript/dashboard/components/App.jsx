import React from 'react';
import PieChart from "./FormChart"
import DeptGraph from "./DeptGraph"
    
export default class App extends React.Component {
    render = () => {
        return (
            <div>
                <div>Welcome back, <%= @employee. %> !</div>
                <h3> Your Dashboard</h3>
                
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
                                <DeptGraph name="Dept Approvals" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        )
    };
}