import React from 'react';

import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const Header = () => (
  <header styleName="root">
    <div styleName="content">
      <div styleName="title-container">
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
      </div>
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
        <div styleName="join-us" weight="bold">
          <Text fontFamily="mono" color="red" weight="bold">
            #inscreve-te
          </Text>
        </div>
      </div>
    </div>
  </header>
);

export default Header;
