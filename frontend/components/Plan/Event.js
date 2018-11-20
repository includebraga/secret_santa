import React from 'react';
import PropTypes from 'prop-types';

import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const Event = ({ day, title, description }) => (
  <div styleName="event" id={day}>
    <Heading level="2" weight="bold" color="yellow">
      {day}
    </Heading>
    <Heading level="2" weight="bold" color="white">
      {title}
    </Heading>
    <div styleName="description">
      <Text>{description}</Text>
    </div>
  </div>
);

Event.propTypes = {
  day: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
};

export default Event;
