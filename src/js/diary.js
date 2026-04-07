import '../css/style.css';
import '../css/mobile.css';
import '../css/diary-card.css';
import { getEntries } from './entries.js';

const getEntriesBtn = document.querySelector('.get_entries');
if (getEntriesBtn) {
  getEntriesBtn.addEventListener('click', getEntries);
}

// merkinnän lisäys
const addEntryForm = document.querySelector('#add-entry-form');
if (addEntryForm) {
  addEntryForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const token = localStorage.getItem('token');

    const formData = {
  entry_date: document.querySelector('#date').value,
  weight: document.querySelector('#weight').value,
  sleep_hours: document.querySelector('#sleep').value,
  mood: document.querySelector('#mood').value,
  notes: "" // testataan tätä
};

    try {
      const response = await fetch('http://localhost:3000/api/entries', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${token}`
        },
        body: JSON.stringify(formData)
      });

      const data = await response.json();

      if (response.ok) {
        alert('Merkintä lisätty!');
        addEntryForm.reset();
        getEntries();
      } else {
        alert('Virhe: ' + (data.message || 'Tallennus epäonnistui'));
      }
    } catch (error) {
      console.error('Fetch-virhe:', error);
    }
  });
}
