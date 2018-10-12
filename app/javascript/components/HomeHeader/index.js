import React from "react";
import Heading from "../Heading";
import Gift from "../Gift";

import "./index.css";
import Logo from "../Logo";

export default class HomeHeader extends React.Component {
  render() {
    return (
      <header styleName="root">
        <div styleName="content">
          <div styleName="first-col">
            <div styleName="info">
              <div styleName="title">
                <Heading color="white">
                  Queres proporcionar um Natal mais feliz a crianças de
                  instituições de Braga?
                </Heading>
              </div>
              <div styleName="text">
                Chegamos ao nosso limite de prendas! Muito obrigado a todos os
                que se inscreveram! Em breve teremos as cartas disponíveis.
              </div>
            </div>
          </div>
          <div styleName="second-col">
            <div styleName="img">
              <Gift />
            </div>
            <Logo prefixed/>
          </div>
        </div>
      </header>
    );
  }
}
