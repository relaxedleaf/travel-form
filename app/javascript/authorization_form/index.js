import React from "react";
import ReactDOM from "react-dom";
import App from "./components/App"

document.addEventListener("DOMContentLoaded", () => {
    const dashboard = document.querySelector("#dashboard");
    ReactDOM.render(<App />, dashboard);
});