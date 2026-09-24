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