import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';
import Heading from 'root/components/Heading';

import './index.css';

const Adventure = () => (
  <Section id="adventure">
    <div styleName="copy">
      <div styleName="title">
        <Heading color="red" weight="bold" underline>
          A Aventura
        </Heading>
      </div>
      <Text color="black">
        Nós recolhemos cartas de crianças e idosos necessitados que se encontram
        ligados a instituições de Braga.
      </Text>
      <Text color="black">
        Tu inscreves-te na nossa plataforma, onde te será atribuída uma carta
        destas crianças ou idosos a quem darás uma prenda que lhes proporcionará
        um Natal mais feliz.
      </Text>
      <Text color="black">
        A carta contém os gostos e sonhos da pessoa que a escreveu sem nunca,
        sem nunca revelar qualquer informação pessoal.
      </Text>
      <Text color="black">
        Durante vários dias estaremos a recolher as prendas em vários pontos da
        cidade de Braga e a fazer as entregas nas instituições.
      </Text>
      <Text color="red" weight="bold">
        Juntos iluminamos o Natal daqueles que precisam.
      </Text>
    </div>
  </Section>
);

export default Adventure;
