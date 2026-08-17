
Attività laboratoriale: codificare un testo con i codici di Huffman
===

Consegna
---

Dopo aver calcolato **i codici di Huffman** [\[vai alla consegna\]](huffman-tree-traversal.md) del testo che vogliamo codificare, è giunto il momento di implementare lo step finale dell'algoritmo: data una corrispondenza "carattere" \\( \leftrightarrow \\) "codice binario" (memorizzata in una qualunque struttura dati di vostra conoscenza), utilizzarla per codificare il testo in questione.


La struttura di massima del programma dovrebbe assomigliare alla seguente:

```csharp
class HuffmanEncoder
{
    /// <summary>
    /// Funzione di Encoding che, preso in input il contenuto di un file di testo, 
    /// mi restituisce una stringa contenente la rispettiva codifica secondo 
    /// l'algoritmo di Huffman
    /// </summary>
    /// <param name="content">Contenuto da codificare</param>
    /// <returns>Il contenuto `content` codificato, in forma di stringa (che altro non sarà che una sequenza di 0 e 1)</returns>
    public static string Encode(string content)
    {
        // 1) Calcolo la tabella delle frequenze di ciascun carattere
        var frequencyTable = BuildFrequencyTable(content);
        // 2) Costruisco l'albero di Huffman a partire da quelle frequenze
        var huffmanTree = BuildHuffmanTree(frequencyTable);
        // 3) Calcolo i codici per ciascun carattere
        var codes = CalculateHuffmanCodes(huffmanTree);

        // 4) Dati i codici appena calcolati, completare la codifica!
        return HuffmanEncode(content, codes); 
    }
}
```