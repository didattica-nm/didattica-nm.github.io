Attività laboratoriale: Progettazione database per una compagnia teatrale
===

Una nota compagnia teatrale del cesenate, tale "*Archimede APS*", è solita mettere in scena spettacoli a tema scientifico, letterario e musicale. Da poco necessitano di un sistema informativo che raccolga le testimonianze delle loro varie rassegne, così da poter realizzare una web app che funga da "portfolio" e archivio per chiunque voglia scoprire qualcosa in più su di loro.

Ogni rassegna della compagnia ha un codice identificativo (obbligatorio), un nome (obbligatorio), una data (obbligatoria), un link ad una registrazione video (se presente) e un link alla pagina di prenotazione dei posti (se presente). 

Ogni rassegna si svolge in una località, dotata di un identificativo (obbligatorio), un nome (obbligatorio), una via (obbligatoria), una città (obbligatoria) ed eventuali coordinate di longitudine e latitudine.

Per ogni rassegna viene pubblicata una locandina che funge da materiale pubblicitario: questa ha un codice identificativo (obbligatorio), un eventuale nome, dimensioni (larghezza e altezza, obbligatorie).  

Per ogni rassegna vengono pubblicati degli articoli sui vari giornali. Per ciascuno si memorizza un estratto (obbligatorio), la data di pubblicazione (obbligatoria), link di riferimento al giornale web (obbligatorio). 

Un articolo appartiene ad una testata giornalistica, identificata da un codice univoco (obbligatorio) e caratterizzata da un nome (obbligatorio) e da un'icona (facoltativo).

Per ogni rassegna vengono scattate delle foto. Queste foto sono raccolte in album, ciascuno dei quali ha un nome (obbligatorio) ed un ID (obbligatorio). Uno o più fotografi possono aver contribuito all'album fotografico: per ciascuno di loro si memorizza un ID, un nome ed un cognome (tutti campi obbligatori). Un album è composto da una serie di foto, ciascuna caratterizzata da un ID (obbligatorio), dimensioni (larghezza e altezza, obbligatorie), contenuto (link all'immagine se salvata nel web o codifica testuale se memorizzata nel database). Tutte le foto inerenti ad una particolare rassegna sono memorizzate dentro ad un unico album. 

Una rassegna può essere "programmata" (se la data prevista $\geq$ data di oggi) o "conclusa" (altrimenti). 

**Progettare uno schema E/R del contenuto informativo precedentemente descritto.**