import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './index.css';

export default class Text extends React.Component {
  static propTypes = {
    children: PropTypes.node.isRequired,
    fontFamily: PropTypes.oneOf(['sans-serif', 'mono']),
    color: PropTypes.oneOf(['navy-blue', 'light-blue', 'orange', 'white']),
    weight: PropTypes.oneOf(['regular', 'bold', 'italic']),
  };

  static defaultProps = {
    fontFamily: 'sans-serif',
    color: 'white',
    weight: 'regular',
  };

  render() {
    const { children, fontFamily, color, weight } = this.props;
    const styles = classNames('root', {
      [fontFamily]: true,
      [color]: true,
      [weight]: true,
    });

    return <p styleName={styles}>{children}</p>;
  }
}
