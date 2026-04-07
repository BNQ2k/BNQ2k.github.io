import '../css/style.css';
import '../css/mobile.css';

const updateAuthStatus = () => {
  const name = localStorage.getItem('name');
  const token = localStorage.getItem('token');
  const nameElement = document.querySelector('.username');
  const loginLink = document.querySelector('#login-link');
  const logoutBtn = document.querySelector('#logout-btn');

  if (nameElement) {
    nameElement.textContent = name ? name : 'vieras';
  }

  // Jos token löytyy, ollaan kirjautuneena
  if (token && token !== "undefined") {
    if (loginLink) loginLink.style.display = 'none';
    if (logoutBtn) logoutBtn.style.display = 'inline-block';
  } else {
    if (loginLink) loginLink.style.display = 'inline-block';
    if (logoutBtn) logoutBtn.style.display = 'none';
  }
};

// out
const logout = () => {
  localStorage.removeItem('token');
  localStorage.removeItem('name');
  window.location.href = 'index.html';
};

const logoutBtn = document.querySelector('#logout-btn');
if (logoutBtn) {
  logoutBtn.addEventListener('click', logout);
}
updateAuthStatus();
