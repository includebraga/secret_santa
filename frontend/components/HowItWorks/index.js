import React, { Component } from "react";
import Heading from "../Heading";

import "./index.css";

export default class HowItWorks extends Component {
  render() {
    return (
      <section styleName="root">
        <div styleName="title">
          <Heading color="black">Como funciona?</Heading>
        </div>
        <div styleName="list">
          <div styleName="list-item">
            <div styleName="icon">
              <i className="icon-note" />
            </div>

            <Heading color="black" secondary>
              Regista-te
            </Heading>

            <div styleName="text">
              Faz o registo para poderes vir a ser um Secret Santa.
            </div>
          </div>
          <div styleName="list-item">
            <div styleName="icon">
              <i className="icon-envelope" />
            </div>

            <Heading color="black" secondary>
              Recebe a carta
            </Heading>

            <div styleName="text">
              Nós iremos atribuir-te a carta de uma criança de uma instituição
              de Braga.
            </div>
          </div>
          <div styleName="list-item">
            <div styleName="icon">
              <i className="icon-present" />
            </div>

            <Heading color="black" secondary>
              Entrega a prenda
            </Heading>

            <div styleName="text">
              De dia 11 a 16 de Dezembro vamos estar à tua espera para receber
              as prendas e dar-te uma recordação do momento.
            </div>
          </div>
        </div>
      </section>
    );
  }
}
