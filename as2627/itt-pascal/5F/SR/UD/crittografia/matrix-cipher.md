Attività laboratoriale: implementare il cifrario a matrice
===

Implementare in C# un cifrario a matrice (anche chiamato "cifrario a colonna", o "*Column Cipher*"). 

Deve essere possibile eseguire le seguenti operazioni:

```csharp
var key = "CARCIOFO";
var cipher = new MatrixCipher(key);

var encrypted = cipher.Encrypt("Costata e crostata");
// "encrypted" should be: "o␣aCettrataots␣asc␣"
 
var decrypted = cipher.Decrypt(encrypted);
// "decrypted" should be: "Costata␣e␣crostata"
```
---

## Processo di cifratura

Gli step dell'algoritmo possono essere così descritti (*ma non necessariamente corrispondono ad un'implementazione diretta!*): 

(1) scelta una chiave, predispongo mentalmente una griglia con tante colonne quante sono le lettere della chiave;
(2) scrivo lettera per lettera il testo da cifrare, scorrendolo da sinistra verso destra, nelle righe sottostanti alle lettere della chiave. Inizio da una prima riga sotto la chiave, e proseguo andando a capo ogni volta che la larghezza della tabella viene raggiunta.

Hint: per ragionare con matrici **regolari** (i.e. matrici in cui ogni cella è occupata da un carattere), se il testo nell'ultima riga termina prima di aver raggiunto la larghezza della colonna inserisco dei caratteri di riempimento (padding).
*P.S: Possibilmente scegliendo un carattere non appartenente all'alfabeto di riferimento del messaggio da cifrare (nell'esempio: @)*

| Key:      | C   | A   | R   | C   | I   | O   | F   | O   |
| --------- | --- | --- | --- | --- | --- | --- | --- | --- |
| **Text:** | C   | o   | s   | t   | a   | t   | a   | ␣   |
|           | e   | ␣   | c   | r   | o   | s   | t   | a   |
|           | t   | a   | @   | @   | @   | @   | @   | @   |

(3) considero l'ordine alfabetico delle lettere che compongono la chiave: leggendo le colonne nell'ordine indicato ottengo il messaggio cifrato.

| Alphabetical order: | 2   | 1   | 8   | 3   | 5   | 6   | 4   | 7   |
| ------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| Key:                | C   | A   | R   | C   | I   | O   | F   | O   |
| **Text:**           | C   | o   | s   | t   | a   | t   | a   | ␣   |
|                     | e   | ␣   | c   | r   | o   | s   | t   | a   |
|                     | t   | a   | @   | @   | @   | @   | @   | @   |

- Colonna 1: `o␣a`
- Colonna 2: `Cet`
- Colonna 3: `tr@`
- Colonna 4: `at@`
- Colonna 5: `ao@`
- Colonna 6: `ts@`
- Colonna 7: `␣a@`
- Colonna 8: `sc@`

<strong>Messaggio cifrato</strong>:  <code>o␣aCettr@at@ao@ts@␣a@sc@</code>

## Processo di decifratura

Gli step dell'algoritmo possono essere così descritti (*ma non necessariamente corrispondono ad un'implementazione diretta!*):

(1) Calcolo delle dimensioni della matrice:

- colonne: `numero di lettere della chiave`
- righe: `lunghezza del testo cifrato` / `colonne`

(2) Ordino alfabeticamente la chiave

| Alphabetical order: | 2   | 1   | 8   | 3   | 5   | 6   | 4   | 7   |
| ------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| Key:                | C   | A   | R   | C   | I   | O   | F   | O   |
| **Text:**           |     |     |     |     |     |     |     |     |
|                     |     |     |     |     |     |     |     |     |
|                     |     |     |     |     |     |     |     |     |
(3) Scrivo per colonne il testo cifrato, seguendo l'ordine indicato dalle lettere della chiave; ogni volta che esaurisco le righe, vado nella colonna successiva (indicata dall'ordine alfabetico della chiave)

| Alphabetical order: | 2   | 1   | 8   | 3   | 5   | 6   | 4   | 7   |
| ------------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| Key:                | C   | A   | R   | C   | I   | O   | F   | O   |
| **Text:**           | C   | o   | s   | t   | a   | t   | a   | ␣   |
|                     | e   | ␣   | c   | r   | o   | s   | t   | a   |
|                     | t   | a   | @   | @   | @   | @   | @   | @   |
(4) Leggendo riga per riga la matrice riempita, ottengo il messaggio decifrato:

<strong>Messaggio decifrato</strong>:  <code>Costata e crostata</code>