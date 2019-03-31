import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App"

document.addEventListener("DOMContentLoaded", () => {
    const authorization_form = document.querySelector("#authorization_form");
    ReactDOM.render(<App />, authorization_form);
});