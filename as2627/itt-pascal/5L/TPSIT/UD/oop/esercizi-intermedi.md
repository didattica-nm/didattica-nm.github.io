# Esercizi di Programmazione Orientata agli Oggetti (C#) - Parte 2

Note: esercizi riadattati con l'aiuto di Google Gemini

Questa seconda parte include esercizi su argomenti più avanzati come formattazione, composizione ed ereditarietà.

Warning: Implementare quanto richiesto sviluppando il codice su più file: in particolare, ad ogni classe corrisponde un file .cs con il medesimo nome (ad es: la classe `Circle` si troverà in `Circle.cs`)

---
## Esercizio #05 
### La classe `Date`

### Consegna

Crea una classe `Date` per modellare una data.
* Proprietà: `Day` (giorno, `int`), `Month` (mese, `int`), `Year` (anno, `int`).
* Un costruttore che accetta `day`, `month` e `year`.
* Un metodo `SetDate(int day, int month, int year)` per reimpostare tutti e tre i valori contemporaneamente.
* L'override del metodo `ToString()` per restituire la stringa nel formato `"DD/MM/YYYY"`, assicurandoti che giorno e mese abbiano lo zero iniziale se sono inferiori a 10 (es. `09/08/2026`).

### Test Unitari (xUnit)

```csharp
using Xunit;

public class DateTests
{
    [Fact]
    public void Constructor_ShouldSetValues()
    {
        var date = new Date(15, 6, 2023);
        Assert.Equal(15, date.Day);
        Assert.Equal(6, date.Month);
        Assert.Equal(2023, date.Year);
    }

    [Fact]
    public void ToString_ShouldFormatWithLeadingZeros()
    {
        var date = new Date(5, 9, 2026);
        Assert.Equal("05/09/2026", date.ToString());
    }

    [Fact]
    public void SetDate_ShouldUpdateAllValues()
    {
        var date = new Date(1, 1, 2000);
        date.SetDate(25, 12, 2024);
        Assert.Equal("25/12/2024", date.ToString());
    }
}
```

## Esercizio #06 
### Le classi `Author` e `Book`

### Consegna

Crea due classi: `Author` (Autore) e `Book` (Libro). Questa è un'introduzione alla **composizione**, in cui un oggetto contiene un altro oggetto.

**Classe `Author`:**
* Proprietà: `Name` (`string`), `Email` (`string`), `Gender` (`char`, 'm' o 'f').
* Costruttore per inizializzare tutte e tre le proprietà.
* Override di `ToString()` in formato: `"Author[Name=?,Email=?,Gender=?]"`.

**Classe `Book`:**
* Proprietà: `Isbn` (`string`), `Name` (`string`), `Author` (di tipo `Author`), `Price` (`double`), `Qty` (`int`, default `0`).
* Costruttore che accetta `isbn`, `name`, `author` e `price` (qty sarà 0).
* Costruttore che accetta `isbn`, `name`, `author`, `price` e `qty`.
* Metodo `GetAuthorName()` che restituisce solo il nome dell'autore del libro.
* Override di `ToString()` in formato: `"Book[Isbn=?,Name=?,Author[...],Price=?,Qty=?]"`. (Usa il `ToString()` dell'autore al suo interno).

### Test Unitari (xUnit)

```csharp
using Xunit;

public class AuthorAndBookTests
{
    [Fact]
    public void AuthorToString_ShouldFormatCorrectly()
    {
        var author = new Author("Dante Alighieri", "dante@poeti.it", 'm');
        Assert.Equal("Author[Name=Dante Alighieri,Email=dante@poeti.it,Gender=m]", author.ToString());
    }

    [Fact]
    public void Book_ShouldRetrieveAuthorName()
    {
        var author = new Author("J.K. Rowling", "jk@rowling.com", 'f');
        var book = new Book("978-3-16-148410-0", "Harry Potter", author, 19.99);
        
        Assert.Equal("J.K. Rowling", book.GetAuthorName());
    }

    [Fact]
    public void BookToString_ShouldIncludeAuthorToString()
    {
        var author = new Author("J.K. Rowling", "jk@rowling.com", 'f');
        var book = new Book("12345", "Harry Potter", author, 19.99, 10);
        
        string expected = "Book[Isbn=12345,Name=Harry Potter,Author[Name=J.K. Rowling,Email=jk@rowling.com,Gender=f],Price=19.99,Qty=10]";
        Assert.Equal(expected, book.ToString());
    }
}
```

## Esercizio #07
### `Person`, `Student` e `Staff`

### Consegna

Scrivi un programma per testare l'**ereditarietà**. Crea una superclasse `Person` e le sue sottoclassi `Student` e `Staff`.

**Classe `Person`:**
* Proprietà: `Name` (sola lettura, `string`), `Address` (`string`).
* Costruttore: `Person(string name, string address)`.
* Override di `ToString()` in formato `"Person[Name=?,Address=?]"`.

**Classe `Student` (Eredita da `Person`):**
* Proprietà: `Program` (`string`), `Year` (`int`), `Fee` (`double`).
* Costruttore: `Student(string name, string address, string program, int year, double fee)`. (Deve chiamare il costruttore della superclasse).
* Override di `ToString()` in formato `"Student[Person[...],Program=?,Year=?,Fee=?]"`.

**Classe `Staff` (Eredita da `Person`):**
* Proprietà: `School` (`string`), `Pay` (`double`).
* Costruttore: `Staff(string name, string address, string school, double pay)`. (Deve chiamare il costruttore della superclasse).
* Override di `ToString()` in formato `"Staff[Person[...],School=?,Pay=?]"`.

### Test Unitari (xUnit)

```csharp
using Xunit;

public class InheritanceTests
{
    [Fact]
    public void Person_ToString_ReturnsCorrectFormat()
    {
        var person = new Person("Guido Rossi", "Via Roma 1");
        Assert.Equal("Person[Name=Guido Rossi,Address=Via Roma 1]", person.ToString());
    }

    [Fact]
    public void Student_ShouldInheritNameAndAddress()
    {
        var student = new Student("Giulia Bianchi", "Piazza Duomo", "Informatica", 2, 1500.50);
        Assert.Equal("Giulia Bianchi", student.Name);
        Assert.Equal("Piazza Duomo", student.Address);
    }

    [Fact]
    public void Student_ToString_ShouldIncludePersonToString()
    {
        var student = new Student("Giulia Bianchi", "Piazza Duomo", "Informatica", 2, 1500.50);
        string expected = "Student[Person[Name=Giulia Bianchi,Address=Piazza Duomo],Program=Informatica,Year=2,Fee=1500.5]";
        Assert.Equal(expected, student.ToString());
    }

    [Fact]
    public void Staff_ToString_ShouldIncludePersonToString()
    {
        var staff = new Staff("Prof. Verdi", "Via Garibaldi", "Ingegneria", 3500.00);
        string expected = "Staff[Person[Name=Prof. Verdi,Address=Via Garibaldi],School=Ingegneria,Pay=3500]";
        Assert.Equal(expected, staff.ToString());
    }
}
```