import React, { Component } from 'react';
import classNames from 'classnames';
import giftHead from '../../images/giftHead.png';
import giftBody from '../../images/giftBody.png';

import './index.css';

const isElementInViewport = el => {
  const rect = el.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <=
      (window.innerHeight ||
        document.documentElement.clientHeight) /* or $(window).height() */ &&
    rect.right <=
      (window.innerWidth ||
        document.documentElement.clientWidth) /* or $(window).width() */
  );
};

export default class Gift extends Component {
  state = {
    animate: false,
  };

  componentDidMount() {
    const { animate } = this.state;
    const gift = document.getElementById('gift');

    if (isElementInViewport(gift)) {
      if (!animate) {
        this.setState({ animate: true });

        setTimeout(() => {
          this.setState({ animate: false });
        }, 1000);
      }
    }
  }

  handleMouseEnter = () => {
    this.setState({ animate: true });
  };

  handleMouseLeave = () => {
    this.setState({ animate: false });
  };

  render() {
    const { animate } = this.state;
    const styles = classNames('root', { withAnimation: animate });

    return (
      <div
        id="gift"
        styleName={styles}
        onMouseEnter={this.handleMouseEnter}
        onMouseLeave={this.handleMouseLeave}
      >
        <img alt="chimney" styleName="image" src={giftHead} />
        <img alt="chimney" styleName="image" src={giftBody} />
      </div>
    );
  }
}
