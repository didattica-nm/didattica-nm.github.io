Attività laboratoriale: modellare un progetto console sulla crittografia
===

Gli algoritmi di crittografia sono numerosi, ma possono essere classificati in base a diverse caratteristiche:
- soggetto trattato
	- su cosa operano?
		- testo
		- codice binario
- numero di chiavi utilizzate
	- la chiave utilizzata per cifrare è la stessa utilizzata per decifrare?
		- simmetrici
		- asimmetrici
- logica di processo
	- come elabora il testo da cifrare/decifrare? 
		- a blocchi
		- mediante stream (flusso continuo di dati)

Le precedenti caratteristiche sono componibili tra di loro: per esempio, il cifrario di Cesare è un algoritmo di cifratura che **opera su un testo** e **utilizza la stessa chiave (numerica) sia in fase di cifratura che decifratura**. 

Creare un progetto C# Console che modelli l'insieme delle precedenti caratteristiche mediante il costrutto più adeguato (*classi? classi astratte? interfacce?*). L'obiettivo è costruire la *codebase* iniziale per l'implementazione di alcuni degli algoritmi di crittografia trattati.