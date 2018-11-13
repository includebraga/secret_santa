import React, { Component } from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import './index.css';

export default class Section extends Component {
  static propTypes = {
    children: PropTypes.node.isRequired,
    color: PropTypes.oneOf(['white', 'red']),
    id: PropTypes.string.isRequired,
  };

  static defaultProps = {
    color: 'white',
  };

  render() {
    const { children, color, id } = this.props;
    const styles = classNames('root', {
      [color]: true,
    });

    return (
      <section styleName={styles} id={id}>
        <div styleName="content">{children}</div>
      </section>
    );
  }
}
