import React from 'react';
import ReactDOM from 'react-dom';

import Home from '../components/Home';

const Index = (props) => <div>Index</div>;

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Index name='React' />,
    document.body.appendChild(document.createElement('div'))
  );
});
