import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';
import Heading from 'root/components/Heading';
import Snowflake from 'root/components/Snowflake';

import './index.css';

const Adventure = () => (
  <Section id="adventure">
    <div styleName="root">
      <div styleName="inner-section">
        <Heading color="red" weight="bold" underline>
          A Aventura
        </Heading>
        <div styleName="copy">
          <Text color="black">
            Nós recolhemos cartas de jovens e idosos necessitados que se
            encontram ligados a instituições de Braga.
          </Text>
          <Text color="black">
            Tu inscreves-te na nossa plataforma, onde te será atribuída uma
            carta destes jovens ou idosos a quem darás uma prenda que lhes
            proporcionará um Natal mais feliz.
          </Text>
        </div>
        <div styleName="left-snowflakes">
          <div styleName="left-section-left-snowflake">
            <Snowflake rotation={15} color="red" />
          </div>
          <div styleName="left-section-right-snowflake">
            <Snowflake rotation={45} color="red" />
          </div>
        </div>
      </div>
      <div styleName="inner-section">
        <div styleName="copy">
          <div styleName="top-snowflake">
            <Snowflake rotation={70} color="red" />
          </div>
          <div styleName="right-snowflakes">
            <div styleName="right-section-left-snowflake">
              <Snowflake rotation={-54} color="red" />
            </div>
            <div styleName="right-section-right-snowflake">
              <Snowflake rotation={-30} color="red" />
            </div>
          </div>
          <Text color="black">
            A carta contêm os gostos e sonhos da pessoa que a escreveu sem
            nunca revelar qualquer informação pessoal.
          </Text>
          <Text color="black">
            Durante vários dias estaremos a recolher as prendas em vários pontos
            da cidade de Braga e a fazer as entregas nas instituições.
          </Text>
        </div>
      </div>
      <div styleName="closing">
        <Text color="red" weight="bold">
          Juntos iluminamos o Natal daqueles que precisam.
        </Text>
      </div>
    </div>
  </Section>
);

export default Adventure;
