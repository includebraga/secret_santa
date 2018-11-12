import React from 'react';
import PropTypes from 'prop-types';

import './index.css';

const Layout = ({ children }) => <div styleName="root">{children}</div>;

Layout.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Layout;
