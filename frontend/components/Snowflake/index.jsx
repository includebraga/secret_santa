import React from 'react';
import PropTypes from 'prop-types';

import './index.css';

const colors = {
  red: '#db3a34',
  white: '#fff',
};

const Snowflake = ({ color, rotation }) => (
  <div styleName="spin">
    <svg
      viewBox="0 0 60 60"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      transform={`rotate(${rotation})`}
      aria-hidden="true"
    >
      <path
        d="M30 5.932v22.734M33.932 2L30 5.932M26.068 2L30 5.932M26.068 2l-3.933 3.932M26.068 9.865l-3.933-3.933M33.932 2l3.933 3.932M33.932 9.865l3.933-3.933M33.387 14.954L30 18.341M26.613 14.954L30 18.341M36.775 17.785L30 24.56M23.225 17.785L30 24.56M54.111 30H30.778M58 33.932L54.068 30M58 26.067L54.068 30M58 26.067l-3.932-3.932M50.135 26.067l3.933-3.932M58 33.932l-3.932 3.933M50.135 33.932l3.933 3.933M45.046 33.387L41.658 30M45.046 26.613L41.658 30M42.215 36.775L35.44 30M42.215 23.225L35.44 30M30 54.068V31.334M33.932 58L30 54.068M26.068 58L30 54.068M26.068 58l-3.933-3.932M26.068 50.135l-3.933 3.933M33.932 58l3.933-3.932M33.932 50.135l3.933 3.933M33.387 45.046L30 41.658M26.613 45.046L30 41.658M36.775 42.215L30 35.44M23.225 42.215L30 35.44M5.889 30h23.333M2 33.932L5.932 30M2 26.067L5.932 30M2 26.067l3.932-3.932M9.865 26.067l-3.933-3.932M2 33.932l3.932 3.933M9.865 33.932l-3.933 3.933M14.954 33.387L18.342 30M14.954 26.613L18.342 30M17.785 36.775L24.56 30M17.785 23.225L24.56 30"
        stroke={colors[color]}
        strokeWidth="2"
        strokeLinecap="square"
      />
    </svg>
  </div>
);

Snowflake.propTypes = {
  color: PropTypes.string,
  rotation: PropTypes.number,
};

Snowflake.defaultProps = {
  color: 'white',
  rotation: 0,
};

export default Snowflake;
