## Esame di Stato A.S. 2025/26

> Sorgente: 
> - https://www.istruzione.it/esame_di_stato/202425/Istituti%20tecnici/Ordinaria/A038_ORD25.pdf

### Premessa

*Un dataset (letteralmente “insieme di dati” in italiano) è una collezione strutturata di una grande quantità di dati, che, ai fini di questa prova, consideriamo organizzata in forma relazionale, all’interno della quale sono descritti elementi di interesse del mondo reale (es. eventi, notizie, oggetti, ecc.) con una serie di caratteristiche.*
*Un dataset può contenere numeri, parole, immagini, suoni, o qualsiasi altro tipo di informazione.*
*I dataset sono fondamentali nell’addestramento di alcune applicazioni di intelligenza artificiale.*
*Fare il labeling (o etichettatura) di un dataset significa aggiungere delle etichette ad ogni elemento per indicare cosa esso rappresenta, o meglio a quale categoria o classe appartiene. Ad esempio, immaginando di avere un dataset di immagini di fiori, il labeling assegnerebbe ad ogni immagine un’etichetta, cioè una stringa contenente il nome del tipo di fiore che quella immagine mostra.*
*L’operazione di labeling è normalmente svolta da chi sa classificare gli elementi presenti nel dataset, in questo esempio un botanico. Tale operazione è necessaria quando si vogliono utilizzare tecniche di intelligenza artificiale e machine learning basate su algoritmi di apprendimento supervisionato. In tal caso viene predisposto un dataset con un numero elevato di elementi già etichettati, detto training dataset, che costituisce un insieme di esempi per addestrare l’algoritmo (o più correttamente per addestrare il modello di intelligenza artificiale). Quando l’algoritmo avrà “imparato” dagli esempi forniti, sarà in grado di classificare autonomamente anche nuovi elementi. Ad esempio, fornendo in input una nuova immagine di un fiore, l’algoritmo addestrato sarà in grado di restituire in output l’etichetta che con grande probabilità lo classifica, ad esempio “margherita”.*

### Caso professionale

Al fine di contrastare il fenomeno delle fake news, ad una società informatica è stato commissionato lo sviluppo di una piattaforma web per effettuare il labeling di un training dataset di grandi dimensioni, per poi addestrare un modello di intelligenza artificiale a classificare le news presenti sul web.
Ogni news è caratterizzata dalla fonte da cui proviene, di cui viene indicata la tipologia (blog, social media, giornale online, piattaforma di streaming, ecc.) e il nome (New York Times, Gazzetta del mezzogiorno, Focus, Facebook, Instagram, TikTok, Spotify, YouTube, ecc.) o comunque il dominio del sito di provenienza. Ogni news è inoltre caratterizzata da un URL che la localizza sul web, una data di pubblicazione, un eventuale titolo, l’autore se disponibile, il contenuto testuale (derivante da articolo di giornale, post su un social, transcript di un video o podcast, ecc.); ad essa possono essere eventualmente associati più contenuti multimediali (audio, video e immagini) ed anche più commenti che possono accompagnare la notizia.

L’obiettivo è classificare ogni news per assegnare alla stessa due etichette, denominate: Topic e Result. 
L’etichetta Topic serve ad indicare a quale argomento la news si riferisce, e potrà assumere un valore tra quelli contenuti in un elenco del tipo: Economia, Politica, Medicina e Salute, Cultura, Cronaca, Scienza e Tecnologia, Sport, ecc. 
L’etichetta Result sarà quella che classificherà effettivamente la notizia, assegnando uno tra i seguenti possibili valori: “Fake” o “Vera” o “Dubbia”. Nel caso in cui la notizia sia etichettata come fake, sarà inoltre necessario stabilire una tra le seguenti possibili motivazioni: “contenuto fabbricato”, “contenuto manipolato”, “contenuto diffuso da impostori”, “falso contesto”, “contenuto ingannevole”, “falsa connessione”, “satira o parodia”, ed inserire poi una nota a sostegno della motivazione.

L’operazione di labeling sarà affidata ad un gruppo di esperti junior e ad un gruppo di esperti senior che agiranno in due fasi successive: nella prima fase il gruppo di esperti junior effettuerà una etichettatura provvisoria delle news; successivamente, il gruppo di esperti senior effettuerà la validazione finale della classificazione svolta nella prima fase, lasciando invariate o correggendo le etichettature con le relative motivazioni compilate dagli esperti junior. Durante le operazioni di etichettatura si avranno quindi news non ancora etichettate, news che hanno ricevuto una etichettatura provvisoria, e news con etichettatura validata.
Alla fine dell’etichettatura del dataset, la piattaforma dovrà anche consentire alcune analisi sui dati etichettati.

### Richieste

Schema E/R, schema E/R ristrutturato, progettazione logica. Possibile svolgerlo su DB Browser for SQLite.