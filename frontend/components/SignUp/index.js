import React from 'react';

import Section from 'root/components/Section';
import Text from 'root/components/Text';
import Heading from 'root/components/Heading';

import './index.css';

const SignUp = () => (
  <Section>
    <div styleName="copy">
      <div styleName="adventure">
        <Heading color="red" weight="bold" underline>
          A Aventura
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
    <form styleName="form" action="/users" method="post">
      <div>
        <label htmlFor="Name">
          <Text color="black">Name</Text>
          <input
            id="name"
            name="user[name]"
            type="name"
            placeholder="Pai Natal"
          />
        </label>
        <label htmlFor="email">
          <Text color="black">Email</Text>
          <input
            id="email"
            name="user[email]"
            type="email"
            placeholder="pai@natal.org"
          />
        </label>
      </div>
      <button styleName="join-us" weight="bold" type="submit">
        <Text fontFamily="mono" color="red" weight="bold">
          #inscreve-te
        </Text>
      </button>
    </form>
  </Section>
);

export default SignUp;
