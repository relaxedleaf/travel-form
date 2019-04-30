import React from 'react';
    
export default class App extends React.Component {    

  render = () => {
    return(
        <div>
            <nav className="navbar navbar-expand-lg navbar-light static-top topbar mb-4 shadow">
                <div className="collapse navbar-collapse">
                    <ul className="nav navbar-nav mr-auto">
                        <li className="nav-item pr-5">
                            <div className="nav-link">
                                <a className="btn btn-outline-primary btn-rounded waves-effect nav-btn text-primary">Pending</a>
                            </div>
                        </li>
                        
                        <li className="nav-item pr-5">
                            <div className="nav-link">
                                <a className="btn btn-outline-primary btn-rounded waves-effect nav-btn text-primary">Completed</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <table className="table">
            
            </table>
            <div className="text-center">
                <a className="btn btn-primary" href="trips/new">Create Form</a>
            </div>
        </div>
        
    )
  };
}