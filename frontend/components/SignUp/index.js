import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';
import Heading from 'root/components/Heading';
import Button from 'root/components/Button';

import './index.css';
import SignUpForm from '../SignUpForm';

const SignUp = () => (
  <Section id="signUp">
    <div styleName="copy">
      <div styleName="title">
        <Heading color="red" weight="bold" underline>
          A Execução
        </Heading>
      </div>
      <Text color="black">
        Para começar a nossa aventura tudo o que precisamos é do teu e-mail e do
        teu nome. As inscrições abrem a 15 de Novembro.
      </Text>
      <Text color="black">
        Vais receber um e-mail de confirmação, com instruções para os próximos
        passos.
      </Text>
      <Text color="black">
        Até lá mantém esse espírito bem quentinho para ajudares os que precisam
        de ti.
      </Text>
    </div>
    <SignUpForm />
  </Section>
);

export default SignUp;
