import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './index.css';

export default class Heading extends React.Component {
  static propTypes = {
    children: PropTypes.node.isRequired,
    fontFamily: PropTypes.oneOf(['sans-serif', 'mono']),
    color: PropTypes.oneOf(['black', 'white']),
    level: PropTypes.oneOf(['1', '2', '3']),
    weight: PropTypes.oneOf(['regular', 'bold', 'italic']),
  };

  static defaultProps = {
    fontFamily: 'sans-serif',
    color: 'white',
    level: '1',
    weight: 'regular',
  };

  render() {
    const { children, level, fontFamily, color, weight } = this.props;
    const styles = classNames('root', {
      [`level${level}`]: true,
      [fontFamily]: true,
      [color]: true,
      [weight]: true,
    });
    const HeadingComponent = `h${level}`;

    return <HeadingComponent styleName={styles}>{children}</HeadingComponent>;
  }
}
