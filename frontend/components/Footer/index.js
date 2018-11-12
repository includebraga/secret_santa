import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';

import Facebook from 'root/assets/facebook.svg';
import Instagram from 'root/assets/instagram.svg';
import Github from 'root/assets/github.svg';

import './index.css';

const Footer = () => (
  <Section color="red">
    <div styleName="root">
      <div styleName="assembled">
        <Text fontFamily="mono">
          assembled and disassembled with{' '}
          <span role="img" aria-label="love">
            ❤️
          </span>{' '}
          by
        </Text>
        <div styleName="include">
          <Text color="red" fontFamily="mono" weight="bold">
            #include &lt;braga&gt;
          </Text>
        </div>
      </div>
      <div styleName="social-links">
        <a href="https://facebook.com/includebraga">
          <Facebook />
        </a>
        <a href="https://instagram.com/includebraga">
          <Instagram />
        </a>
        <a href="https://github.com/includebraga">
          <Github />
        </a>
      </div>
    </div>
  </Section>
);

export default Footer;
