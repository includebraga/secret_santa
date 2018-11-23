import React, { Component } from 'react';

import Text from 'root/components/Text';
import Button from '../Button';

import './index.css';

export default class SignUpForm extends Component {
  state = { name: '', email: '' };

  handleChange = event => {
    this.setState({ [event.target.id]: event.target.value });
  };

  handleSubmit = event => {
    if (!this.formIsValid()) {
      event.preventDefault();
    }
  };

  formIsValid = () => {
    const { name, email } = this.state;

    return name !== '' && email !== '';
  };

  render() {
    const { name, email } = this.state;

    return (
      <form
        styleName="form"
        action="/users"
        method="post"
        onSubmit={this.handleSubmit}
      >
        <div>
          <label htmlFor="Name">
            <Text color="black">Nome</Text>
            <input
              id="name"
              name="user[name]"
              type="name"
              placeholder="Pai Natal"
              value={name}
              onChange={this.handleChange}
            />
          </label>
          <label htmlFor="email">
            <Text color="black">Email</Text>
            <input
              id="email"
              name="user[email]"
              type="email"
              placeholder="pai@natal.org"
              value={email}
              onChange={this.handleChange}
            />
          </label>
          <div styleName="policies-container">
            <a styleName="policies" href="/policies/users/pt">
              * O que fazem com os meus dados?
            </a>
          </div>
        </div>
        <div styleName="join-us">
          <Button disabled={!this.formIsValid()} />
        </div>
      </form>
    );
  }
}
