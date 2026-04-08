## Ohjelmistotestaus 20p.

## 1. Asennetut työkalut ja kirjastot

Työkalu Käyttötarkoitus

Robot Framework Automaatiotestaus
Browser Library Selaintestaus
Requests Library API/backend-testaus
CryptoLibrary Salasanojen salaus testeissä
Robotidy Testikoodin formatointi

Asennusprosessi:

    Päivitin Pythonin versioon 3.14 Homebrew’n avulla.

    Loin virtuaaliympäristön: python3.14 -m venv .venv.

    Asensin kirjastot: pip install robotframework robotframework-browser.

    Alustin selainajurit: rfbrowser init.

## 2. Kirjautumistesti
Testitiedosto: tests/front/login_test.robot
Resurssitiedosto: tests/front/Keywords.robot (sisältää testikäyttäjän tunnukset).
testin ajaminen terminalissa, "robot tests/front/browser_demo.robot"
heittää meidät kivigym login.html sivulle ja kirjaa tiedot, jonka jälkeen kirjautuu sisään.

Testin kulku:

    Robotti avaa Chromium-selaimen ja navigoi osoitteeseen http://localhost:5173/login.html.

    Se etsii HTML-elementit tunnisteiden perusteella (id=login-username ja id=login-password).

    Syöttää niihin Keywords.robot-tiedostossa määritellyt testitunnukset.

    Klikkaa "Kirjaudu"-painiketta (input.loginform.btn-primary).

    Testi päättyy tilaan PASS, jos kirjautuminen onnistuu ja sivu reagoi odotetusti.



## 3. GUI testaus

Testitiedot:

    Testisivusto: https://www.selenium.dev/selenium/web/web-form.html

    Testitiedosto: tests/front/tehtava3.robot

    Testin ajaminen: robot tests/front/tehtava3.robot

Testin kulku ja testatut elementit:

    Tekstisyöttö: Kirjoitetaan tekstiä kenttiin (nimi, salasana, viesti)

    Dropdown: Valitaan valikosta vaihtoehto "Two" käyttämällä sen arvoa (value=2) Select Options By -avainsanalla.

    Checkbox: Klikataan valintaruutua (#my-check-1).

    File input: testfile.txt

    Radio: Valitaan Default radio

    Muita en saanut vielä toimimaan

## 4. Päiväkirjamerkintä

Testitiedosto: tests/front/tehtava4.robot

Testin tarkoitus: Varmistaa, että käyttäjä voi lisätä uuden terveyspäiväkirjamerkinnän ja että tiedot tallentuvat backendiin asti.

Testin ajaminen: robot tests/front/tehtava4.robot

Testin kulku ja testatut elementit:

    Päivämäärän valinta, "#date" haluttu päivämäärä YYYY-MM-DD muodossa

    Numeeriset syötöt, #weight ja #sleep.

    Tekstisyöttö, #mood

    Lomakkeen tallennus CSS-selektorilla button[type="submit"]

## 5. .env Kirjautumistesti

Testitiedosto: tests/front/tehtava5.robot

Testin tarkoitus: Varmistaa sovelluksen tietoturvallinen testaus käyttämällä ulkoista .env-tiedostoa arkaluonteisten tietojen (käyttäjätunnus ja salasana) hallintaan.

Testin ajaminen: robot tests/front/tehtava5.robot

Testin vaiheet:

    Ympäristön alustus: Ladattiin .env-tiedosto, joka sisältää muuttujat MY_USER ja MY_PASS.

    Selainyhteys: Avattiin Chrome kirjautumissivulta ja navigoitiin kirjautumis kohtaan.

    Datan syöttö:

        Käyttäjätunnus syötettiin tavallisena tekstinä.

        Salasana syötettiin suojatusti.

    Siivous: Selain suljetaan testin päätteeksi, vaikka testi epäonnistuisi, jotta resursseja ei jää roikkumaan.

## 6. Cryptatut testitunnukset


Testitiedosto: tests/front/tehtava6.robot

Testin tarkoitus: Toteuttaa korkeimman tason tietoturva automaatiotesteissä käyttämällä epäsymmetristä salausta. Tunnuksia ei säilytetä selväkielisenä missään vaiheessa elinkaarta.

Testin ajaminen: robot tests/front/tehtava6.robot

Testin vaiheet:

    Ympäristön lataus: .env-tiedostosta noudetaan muuttujat MY_CRYPT_USER ja MY_CRYPT_PASS. Nämä sisältävät vain salattua dataa.

    Selainyhteys: Avattiin Chrome kirjautumissivulta ja navigoitiin kirjautumis kohtaan.

    Älykäs syöttö: Käytetään Fill Text -avainsanaa kryptatun muuttujan kanssa. CryptoLibrary tunnistaa salauksen ja hoitaa purkamisen taustalla juuri ennen kuin teksti lähetetään HTML-elementtiin.

    Siivous: Selain suljetaan testin päätteeksi, vaikka testi epäonnistuisi, jotta resursseja ei jää roikkumaan.

## 7. Outputs-kansio

Testien loki- ja raporttitiedostot ohjataan outputs/-kansioon lisäämällä --outputdir flag:

    robot --outputdir outputs tests/front/tehtava3.robot

Tulostiedostot:
- outputs/log.html
- outputs/report.html
- outputs/output.xml

## 8. Github.io log & report on html

TESTIT:
- [Log](https://bnq2k.github.io/log.html)
- [Report](https://bnq2k.github.io/report.html)
