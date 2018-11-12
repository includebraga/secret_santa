import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './index.css';

export default class Section extends Component {
  static propTypes = {
    children: PropTypes.node.isRequired,
    color: PropTypes.oneOf(['white', 'red']),
  };

  static defaultProps = {
    color: 'white',
  };

  render() {
    const { children, color } = this.props;
    const styles = classNames('root', {
      [color]: true,
    });

    return (
      <div styleName={styles}>
        <div styleName="content">{children}</div>
      </div>
    );
  }
}
