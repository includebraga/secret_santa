import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';
import Heading from 'root/components/Heading';

import './index.css';

const SignUp = () => (
  <Section id="signUp">
    <div styleName="copy">
      <div styleName="title">
        <Heading color="red" weight="bold" underline>
          A Execução
        </Heading>
      </div>
      <Text color="black">
        De momento as nossas inscrições estão fechadas! Já conseguimos atribuir todas as cartas que temos de momento!
      </Text>
      <Text color="black">
        No entanto, não desanimes. Nestas próximas semanas poderás ter a oportunidade de te registares como um rematcher, portanto fica atento às redes sociais para receberes notícias!
      </Text>
    </div>
  </Section>
);

export default SignUp;
