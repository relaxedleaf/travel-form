import React from "react";
import ReactDOM from "react-dom";
import Test from "./components/Test"

document.addEventListener("DOMContentLoaded", () => {
    const authorization_form = document.querySelector("#authorization_form");
    const message = authorization_form.getAttribute("message");
    ReactDOM.render(<Test message={message}/>, authorization_form);
});