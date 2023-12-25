import React, { useState } from 'react'

export default function MyCounter({ initCount /* int */, onChange /* event */ }) {
  const [count, setCount] = useState(initCount || 0);

  function handleClick(event) {
    event.stopPropagation();
    const newCount = count + 1;
    setCount(newCount)
    onChange(newCount)
  }

  return (
    <div className="pa-3 my-3" style={{ border: 'solid 2px red', borderRadius: 8 }}>
      <h3>我用 React 開發出來的</h3>
      <p>You clicked {count} times</p>
      <button className="btn btn-primary" onClick={handleClick}>
        Click me
      </button>
    </div>
  )
}
