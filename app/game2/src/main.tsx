import React from "react";
import ReactDOM from "react-dom/client";
import styled from "styled-components";
import App from "./App.tsx";
import "./index.css";

export const AppContainer = styled.div`
  display: flex;
  justify-content: center;
  width: 100%;
  height: 100%;
`;

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <AppContainer>
      <App />
    </AppContainer>
  </React.StrictMode>,
);
