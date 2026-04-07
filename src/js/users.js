const addUser = async (event) => {
  event.preventDefault(); // estetään uudelleenlataus

  // haetaan lomakkeen kentät
  const usernameInput = document.querySelector('#username');
  const passwordInput = document.querySelector('#password');
  const emailInput = document.querySelector('#email');

  const userData = {
    username: usernameInput.value,
    password: passwordInput.value,
    email: emailInput.value
  };

  try {
    const response = await fetch('http://localhost:3000/api/users', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(userData)
    });

    if (!response.ok) {
      throw new Error('Käyttäjän lisääminen epäonnistui');
    }

    const result = await response.json();
    console.log('Käyttäjä lisätty onnistuneesti:', result);

    // tyhjentää lomakkeen
    event.target.reset();

    alert('Käyttäjä ' + result.username + ' lisätty!');

  } catch (error) {
    console.error('Virhe:', error);
    alert('Virhe käyttäjää lisättäessä');
  }
};

export { addUser };
