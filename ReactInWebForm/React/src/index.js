"use strict";
import React from 'react'
import ReactDOM from 'react-dom/client'
import r2wc from "@r2wc/react-to-web-component"
// import { v4 as uuidv4 } from 'uuid'
import MyCounter from './MyCounter'
import MyQRCode from './MyQRCode'

//#region 只能註冊簡單的 Web Componnets
//※ 只能 props-down 尚無法 events-up。

customElements.define("web-qrcode", r2wc(MyQRCode, {
  props: {
    code: "string",
  },
}));

customElements.define("web-counter", r2wc(MyCounter, {
  props: {
    initCount: "number",
    onChange: "function",
  },
}));

//#endregion

//## 註冊雙向繫結 React 元件：MyCounter
window.renderMyCounter = function (rootElementId, initCount, evtTarget) {
  function handleChange(newCount) {
    // events up
    //dotNetObject.invokeMethodAsync('OnCountChange', newCount);
    console.log(`MyCounter → ${newCount}`);
    evtTarget.dispatchEvent(new CustomEvent("my-counter-up", { detail: newCount }));
  }

  // props down
  const rootElement = document.getElementById(rootElementId);
  const root = ReactDOM.createRoot(rootElement);
  root.render(<MyCounter initCount={initCount} onChange={handleChange} />);
  console.log(`renderMyCounter.render → ${rootElementId}`);
}

//## 註冊單向繫結 React 元件：qrcode.react
window.renderMyQRCode = function (rootElementId, code) {
  const rootElement = document.getElementById(rootElementId);
  const root = ReactDOM.createRoot(rootElement);
  root.render(<MyQRCode code={code} />);
}
