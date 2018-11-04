import React from 'react';

import Heading from 'root/components/Heading';
import Text from 'root/components/Text';
import Separator from 'root/components/Separator';

import './index.css';

const Header = () => (
  <header styleName="root">
    <div styleName="content">
      <div styleName="the-impossible">
        <Heading weight="bold">o impossível acontece.</Heading>
      </div>

      <div styleName="secret-santa">
        <div styleName="with-underline">
          <Heading level="2" weight="bold">
            secret santa
          </Heading>
        </div>
        <div styleName="include">#include &lt;braga&gt;</div>
      </div>

      <Separator />

      <div styleName="a-year-ago">
        <Text weight="bold">
          há um ano ajudamos mais de 160 crianças e idosos a passar um Natal
          mais feliz.
        </Text>
        <Text weight="bold">este ano somos muitos mais.</Text>
      </div>
    </div>
  </header>
);

export default Header;
