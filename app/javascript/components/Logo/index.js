import React, { Component } from "react";
import PropTypes from "prop-types";
import classNames from "classnames";

import "./index.css";

export default class Logo extends Component {
  static propTypes = {
    color: PropTypes.oneOf(["yellow", "white"]),
    small: PropTypes.bool,
    prefixed: PropTypes.bool
  };

  static defaultProps = {
    color: "yellow",
    small: false,
    prefixed: false
  };

  render() {
    const { color, small, prefixed } = this.props;
    const styles = classNames("root", {
      yellow: color === "yellow",
      small
    });
    const prefixedStyles = classNames("root lettering", {
      yellow: color === "yellow"
    });

    if (prefixed) {
      return (
        <div styleName="prefixed">
          <div styleName={prefixedStyles}>#i</div>
          <div styleName={styles}>#include &lt;braga&gt;</div>
        </div>
      );
    }

    return <div styleName={styles}>#include &lt;braga&gt;</div>;
  }
}
