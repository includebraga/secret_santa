import React, { Component } from "react";
import PropTypes from "prop-types";
import classNames from "classnames";

import "./index.css";

export default class Heading extends Component {
  static propTypes = {
    color: PropTypes.oneOf(["white", "red"]),
    secondary: PropTypes.bool.isRequired,
    centered: PropTypes.bool.isRequired
  };

  static defaultProps = {
    color: "white",
    secondary: false,
    centered: false
  };

  render() {
    const { color, secondary, centered, children } = this.props;

    const styles = classNames("root", {
      [color]: true,
      secondary,
      centered
    });

    return <div styleName={styles}>{children}</div>;
  }
}
