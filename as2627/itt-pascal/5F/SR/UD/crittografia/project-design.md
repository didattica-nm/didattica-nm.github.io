Attività laboratoriale: modellare un progetto console sulla crittografia
===

Gli algoritmi di crittografia sono numerosi, ma possono essere classificati in base a diverse caratteristiche:

- tipologia di dato
	- *su cosa opera l'algoritmo?*
		- testo
		- codice binario
- numero di chiavi utilizzate
	- *la chiave utilizzata per cifrare è la stessa utilizzata per decifrare?*
		- cifrari simmetrici
		- cifrari asimmetrici
- logica di processo dei dati
	- *come viene elaborato il testo da cifrare/decifrare?* 
		- a blocchi
		- mediante stream (flusso continuo di dati)

Le precedenti caratteristiche sono componibili tra di loro: per esempio, il cifrario di Cesare è un algoritmo di cifratura che **opera su un testo** e **utilizza la stessa chiave (numerica) sia in fase di cifratura che decifratura**. 

Creare un progetto `C#` Console che modelli l'insieme delle precedenti caratteristiche mediante il costrutto più opportuno (*classi? classi astratte? interfacce? A voi la scelta*). L'obiettivo è costruire la *codebase* iniziale per l'implementazione di alcuni dei cifrari di seguito trattati.