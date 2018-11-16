import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames';

import Text from 'root/components/Text';

import './index.css';

const Button = ({ handleClick, href, disabled }) => {
  const rootStyles = classNames('root', {
    disabled,
  });
  const Component = href ? 'a' : 'button';

  return (
    <div styleName={rootStyles}>
      <Component styleName="tag" href={href} onClick={handleClick}>
        <div styleName="content">
          <Text fontFamily="mono" color="red" weight="bold">
            #inscreve-te
          </Text>
        </div>
        <div styleName="shadow" />
      </Component>
    </div>
  );
};

Button.propTypes = {
  handleClick: PropTypes.func,
  href: PropTypes.string,
  disabled: PropTypes.bool,
};

Button.defaultProps = {
  handleClick: null,
  href: null,
  disabled: false,
};

export default Button;
