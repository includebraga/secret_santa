import React from 'react';

import Section from 'root/components/Section';
import Heading from 'root/components/Heading';
import Event from './Event';
import eventsList from './eventsList';

import './index.css';

const Plan = () => (
  <Section color="red" id="Plan">
    <div styleName="copy">
      <div styleName="title">
        <Heading color="white" weight="bold" underline>
          O Plano
        </Heading>
      </div>
      <div styleName="events">
        {eventsList.map((event, index) => (
          <Event key={event.day} {...event} index={index} />
        ))}
      </div>
    </div>
  </Section>
);

export default Plan;
