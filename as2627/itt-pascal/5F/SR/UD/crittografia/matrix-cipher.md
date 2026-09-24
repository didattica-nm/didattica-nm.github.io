Attività laboratoriale: implementare il cifrario a matrice
===

Implementare in C# l'algoritmo crittografico a trasposizione "cifrario a matrice". 

Deve essere possibile eseguire le seguenti operazioni:

```csharp
var key = "CARCIOFO";
var cipher = new MatrixCipher(key);

var encrypted = cipher.Encrypt("Costata e crostata");
var decrypted = cipher.Decrypt(encrypted);
```