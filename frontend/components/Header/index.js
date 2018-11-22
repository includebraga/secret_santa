import React from 'react';

import Section from 'root/components/Section';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';
import Button from 'root/components/Button';
import Magic from './Magic';

import './index.css';

const Header = () => (
  <Section color="red" id="header" snowflakes>
    <header styleName="title-container">
      <div styleName="title">
        <div styleName="secret-santa">
          <Heading weight="bold" underline>
            Secret Santa
          </Heading>
        </div>
        <Magic />
      </div>
    </header>
    <div styleName="description">
      <div styleName="include">
        <Text fontFamily="mono" weight="bold">
          #include &lt;braga&gt;
        </Text>
      </div>
      <div styleName="a-year-ago">
        <Text>
          Há um ano ajudamos mais de 160 crianças e idosos a passar um Natal
          mais feliz.
        </Text>
        <Text weight="bold">Este ano somos muitos mais.</Text>
      </div>
      <div styleName="join-us">
        <Button href="#signUp" />
      </div>
    </div>
  </Section>
);

export default Header;
