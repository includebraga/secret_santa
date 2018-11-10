import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './index.css';

export default class Heading extends React.Component {
  static propTypes = {
    children: PropTypes.node.isRequired,
    fontFamily: PropTypes.oneOf(['sans-serif', 'mono']),
    color: PropTypes.oneOf(['black', 'white', 'red', 'yellow']),
    level: PropTypes.oneOf(['1', '2', '3']),
    weight: PropTypes.oneOf(['regular', 'bold', 'italic']),
    underline: PropTypes.bool,
  };

  static defaultProps = {
    fontFamily: 'mono',
    color: 'white',
    level: '1',
    weight: 'regular',
    underline: false,
  };

  render() {
    const {
      children,
      level,
      fontFamily,
      color,
      weight,
      underline,
    } = this.props;
    const styles = classNames('root', {
      [`level${level}`]: true,
      [fontFamily]: true,
      [color]: true,
      [weight]: true,
      underline,
    });

    const HeadingComponent = `h${level}`;

    return <div><HeadingComponent styleName={styles}>{children}</HeadingComponent></div>;
  }
}
