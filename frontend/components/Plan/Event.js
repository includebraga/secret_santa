import React from 'react';
import PropTypes from 'prop-types';

import Heading from 'root/components/Heading';
import Text from 'root/components/Text';
import Snowflake from 'root/components/Snowflake';

import './index.css';

const Event = ({ day, title, description, index }) => (
  <div id={day} styleName="event">
    <div styleName="snowflake-container">
      <Snowflake rotation={index * 15} />
    </div>
    <div styleName="content">
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
  </div>
);

Event.propTypes = {
  day: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  index: PropTypes.number.isRequired,
};

export default Event;
