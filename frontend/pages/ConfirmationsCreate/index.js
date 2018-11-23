import React from 'react';
import PropTypes from 'prop-types';

import Layout from 'root/components/Layout';
import Heading from 'root/components/Heading';
import Text from 'root/components/Text';

import './index.css';

const renderLetter = letter => (
  <div styleName="letter" dangerouslySetInnerHTML={{ __html: letter }} /> // eslint-disable-line react/no-danger
);

const ConfirmationsCreatePage = ({ username, letter, code }) => (
  <Layout>
    <div styleName="root">
      {' '}
      <Heading level="2" weight="bold" color="black">
        Secret Santa confirmado!
      </Heading>
      <div styleName="text">
        <Text color="black">
          {username}, acabaste de te tornar num Secret Santa!
        </Text>
        <Text color="black">
          Em baixo tens a carta da criança que te foi atribuída. Terás uma cópia
          desta carta no teu email se a quiseres voltar a consultar.
        </Text>
        <Text color="black">
          As cartas contém informações privadas por isso não partilhes a tua com
          mais ninguém. Em especial, não partilhes nas redes sociais.
        </Text>
        <Text color="black">
          A tua prenda deve ser escolhida com amor
          <span role="img" aria-label="heart emoji"> ❤️</span>. Apelamos à tua
          criatividade e originalidade. E também apelamos ao teu bom senso. Os
          presenteados vão receber prendas em conjunto e por isso devemos evitar
          grandes discrepâncias. Sendo assim, não ofereças nada velho ou
          descartável mas também te pedimos para não exagerares no preço da tua
          prenda.
        </Text>
        <Text color="black">
          Visita o nosso{' '}
          <a href="https://www.facebook.com/includebraga">Facebook</a> para
          saber onde entregar a prenda! No momento da entrega por favor não te
          esqueças de entregar este código também (coloca uma etiqueta com isto
          se puderes!).
        </Text>
        <Text color="black" weight="bold">{code}</Text>
        <Text color="black">
          Qualquer dúvida podes contactar-nos nas redes sociais ou por email{' '}
          <a href="mailto:includebraga@gmail.com">includebraga@gmail.com</a>
        </Text>
      </div>
      {renderLetter(letter)}
    </div>
  </Layout>
);

ConfirmationsCreatePage.propTypes = {
  username: PropTypes.string.isRequired,
  letter: PropTypes.string.isRequired,
  code: PropTypes.string.isRequired,
};

export default ConfirmationsCreatePage;
