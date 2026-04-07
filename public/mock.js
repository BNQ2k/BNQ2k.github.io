import { fetchData } from './fetch.js';

const diaryContainer = document.querySelector('.diary-card-area');

// Mock-data (testidata), joka korvaa oikean tietokantahaun
const mockEntries = [
  {
    "entry_id": 1,
    "entry_date": "2026-02-28",
    "mood": "Happy",
    "weight": 70.5,
    "sleep_hours": 8,
    "notes": "Sain koodin toimimaan mock-datalla!"
  },
  {
    "entry_id": 2,
    "entry_date": "2026-02-27",
    "mood": "Tired",
    "weight": 71.0,
    "sleep_hours": 6,
    "notes": "Pitkä päivä, mutta capybarat piristivät."
  }
];

const getEntries = async (event) => {
  console.log('Käytetään mock-dataa...');

  // 1. Tässä vaiheessa emme tee fetch-kutsua, vaan käytämme suoraan mockEntries-listaa
  const response = mockEntries;

  // 2. Tyhjennetään korttialue
  diaryContainer.innerHTML = '';

  // 3. Luodaan kortit
  response.forEach((entry) => {
    const card = document.createElement('div');
    card.classList.add('card');

    const cardDiary = document.createElement('div');
    cardDiary.classList.add('card-text');
    cardDiary.innerHTML = `
      <p><strong>Date:</strong> ${entry.entry_date}</p>
      <p><strong>Mood:</strong> ${entry.mood}</p>
      <p><strong>Weight:</strong> ${entry.weight} kg</p>
      <p><strong>Sleep:</strong> ${entry.sleep_hours} h</p>
      <p><strong>Notes:</strong> ${entry.notes}</p>
    `;

    card.appendChild(cardDiary);
    diaryContainer.appendChild(card);
  });
};

export { getEntries };
