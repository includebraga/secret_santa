import React, { Component } from 'react';

import Heading from '../Heading';

import './index.css';

const QUOTES = [
  'A magia existe',
  'O impossível acontece',
  'Os sonhos realizam-se',
];

export default class Magic extends Component {
  state = {
    quoteIndex: 0,
  };

  constructor(props) {
    super(props);

    this.interval = setInterval(() => {
      this.setState(prevState => {
        const newIndex =
          prevState.quoteIndex === QUOTES.length - 1
            ? 0
            : prevState.quoteIndex + 1;

        return { quoteIndex: newIndex };
      });
    }, 3500);
  }

  render() {
    const { quoteIndex } = this.state;
    const currentQuote = QUOTES[quoteIndex];

    return (
      <div styleName="magic">
        <Heading weight="bold">{currentQuote}</Heading>
      </div>
    );
  }
}
