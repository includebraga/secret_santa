import React from 'react';

import Heading from 'root/components/Heading';
import Text from 'root/components/Text';
import Button from 'root/components/Button';

import './index.css';
import Section from '../Section';

const Header = () => (
  <Section color="red" id="header">
    <header styleName="title-container">
      <div styleName="title">
        <div styleName="secret-santa">
          <Heading weight="bold" underline>
            Secret Santa
          </Heading>
        </div>
        <div styleName="the-impossible">
          <Heading weight="bold">O impossível acontece</Heading>
        </div>
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
