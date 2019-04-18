import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App"

document.addEventListener("DOMContentLoaded", () => {
    const reimbursement_form = document.querySelector("#reimbursement_form");

    ReactDOM.render(<App />, reimbursement_form);
});