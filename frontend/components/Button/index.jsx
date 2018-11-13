import React from 'react';
import PropTypes from 'prop-types';

import Text from 'root/components/Text';

import './index.css';

const Button = ({ handleClick, href }) => {
  const Component = href ? 'a' : 'button';

  return (
    <Component styleName="root" href={href} onClick={handleClick}>
      <Text fontFamily="mono" color="red" weight="bold">
        #inscreve-te
      </Text>
    </Component>
  );
};

Button.propTypes = {
  handleClick: PropTypes.func,
  href: PropTypes.string,
};

Button.defaultProps = {
  handleClick: null,
  href: null,
};

export default Button;
