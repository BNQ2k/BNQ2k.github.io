import { fetchData } from './fetch.js';

const diaryContainer = document.querySelector('.diary-card-area');

const getEntries = async () => {
  const url = 'http://localhost:3000/api/entries';
  const token = localStorage.getItem('token');

  if (!token || token === "undefined") {
    alert("Kirjaudu ensin sisään!");
    return;
  }

  const options = {
    method: 'GET',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    }
  };

  const response = await fetchData(url, options);

  if (response.error) {
    console.error('Virhe haussa:', response.error);
    return;
  }

  if (diaryContainer) {
    diaryContainer.innerHTML = '';
  }

  response.forEach((entry) => {
    const card = document.createElement('div');
    card.classList.add('card');

    card.innerHTML = `
      <div class="card-header">
        <h3>${new Date(entry.entry_date).toLocaleDateString('fi-FI')}</h3>
        <span class="mood-tag">${entry.mood}</span>
      </div>
      <div class="card-body">
        <p><strong>Paino:</strong> ${entry.weight} kg</p>
        <p><strong>Unen määrä:</strong> ${entry.sleep_hours} h</p>
        <p class="notes-text">${entry.notes || ''}</p>
      </div>
    `;

    const deleteBtn = document.createElement('button');
    deleteBtn.classList.add('delete-card-btn');
    deleteBtn.textContent = 'POISTA';

    deleteBtn.addEventListener('click', async () => {
      if (confirm('Haluatko varmasti poistaa tämän merkinnän?')) {
        try {
          const deleteOptions = {
            method: 'DELETE',
            headers: {
              'Authorization': `Bearer ${token}`
            }
          };
          const deleteUrl = `http://localhost:3000/api/entries/${entry.entry_id}`;
          const res = await fetch(deleteUrl, deleteOptions);

          if (res.ok) {
            alert('Merkintä poistettu!');
            getEntries(); // Haetaan lista uudestaan heti
          } else {
            alert('Poisto epäonnistui.');
          }
        } catch (err) {
          console.error('Virhe poistossa:', err);
        }
      }
    });

    card.appendChild(deleteBtn);
    diaryContainer.appendChild(card);
  });
};

export { getEntries };
