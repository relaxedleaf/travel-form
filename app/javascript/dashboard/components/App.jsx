import React from 'react';
import PieChart from "./FormChart"
import DeptGraph from "./DeptGraph"
    
export default class App extends React.Component {
    render = () => {
        return (
            <div>
                <h2> Your Dashboard</h2>
                
                <div className="row">
                    <div className="col-xl-9 col-lg-7">
                        <div className="card shadow mb-4">
                            <div className="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 className="m-0 font-weight-bold text-primary">Your Forms</h6>
                            </div>

                            <div className="card-body">
                                <PieChart  />
                            </div>
                        </div>
                    </div>
    

                    <div className="col-xl-8 col-lg-7">
                        <div className="card shadow mb-4">
                            <div className="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 className="m-0 font-weight-bold text-primary">Department Approval Rates</h6>
                            </div>

                            <div className="card-body">
                                <DeptGraph name="Dept Approvals" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        )
    };
}