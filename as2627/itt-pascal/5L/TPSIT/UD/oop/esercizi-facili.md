# Esercizi di Programmazione Orientata agli Oggetti (C#)

Note: esercizi riadattati con l'aiuto di Google Gemini

Questa raccolta adatta i classici esercizi Java OOP per il linguaggio C#. In C#, invece di utilizzare i metodi `getX()` e `setX()`, è convenzione utilizzare le **Properties** (`{ get; set; }`).

Tutti i test unitari sono scritti utilizzando **xUnit**.

Warning: Implementare quanto richiesto sviluppando il codice su più file: in particolare, ad ogni classe corrisponde un file .cs con il medesimo nome (ad es: la classe `Circle` si troverà in `Circle.cs`)

---

## Esercizio 1: La classe `Circle`

### Consegna
Crea una classe chiamata `Circle` per modellare un cerchio. 
La classe deve contenere:
- Due proprietà: `Radius` (di tipo `double`, default `1.0`) e `Color` (di tipo `string`, default `"red"`).
- Un costruttore vuoto (che utilizza i valori di default).
- Un costruttore che accetta solo il raggio.
- Un costruttore che accetta raggio e colore.
- Un metodo `GetArea()` che restituisce l'area del cerchio (`double`).
- Un metodo `GetCircumference()` che restituisce la circonferenza (`double`).
- L'override del metodo `ToString()` per restituire una stringa nel formato `"Circle[Radius=r,Color=c]"`.

### Test Unitari (xUnit)

```csharp
using System;
using Xunit;

public class CircleTests
{
    [Fact]
    public void DefaultConstructor_ShouldSetDefaultValues()
    {
        var circle = new Circle();
        Assert.Equal(1.0, circle.Radius);
        Assert.Equal("red", circle.Color);
    }

    [Fact]
    public void OverloadedConstructor_ShouldSetRadiusAndColor()
    {
        var circle = new Circle(2.5, "blue");
        Assert.Equal(2.5, circle.Radius);
        Assert.Equal("blue", circle.Color);
    }

    [Fact]
    public void GetArea_ShouldReturnCorrectArea()
    {
        var circle = new Circle(2.0);
        double expectedArea = Math.PI * 4.0;
        Assert.Equal(expectedArea, circle.GetArea(), 5); // Tolleranza 5 decimali
    }

    [Fact]
    public void ToString_ShouldReturnFormattedString()
    {
        var circle = new Circle(3.0, "green");
        Assert.Equal("Circle[Radius=3,Color=green]", circle.ToString());
    }
}
```

---

## Esercizio 2: La classe `Rectangle`

### Consegna
Crea una classe chiamata `Rectangle`.
La classe deve contenere:
- Due proprietà: `Length` (tipo `float`, default `1.0f`) e `Width` (tipo `float`, default `1.0f`).
- Un costruttore senza parametri.
- Un costruttore che accetta `length` e `width`.
- Un metodo `GetArea()` che restituisce l'area (`float`).
- Un metodo `GetPerimeter()` che restituisce il perimetro (`float`).
- L'override del metodo `ToString()` per restituire `"Rectangle[Length=l,Width=w]"`.

### Test Unitari (xUnit)

```csharp
using Xunit;

public class RectangleTests
{
    [Fact]
    public void Constructor_ShouldSetValuesCorrectly()
    {
        var rect = new Rectangle(2.5f, 4.0f);
        Assert.Equal(2.5f, rect.Length);
        Assert.Equal(4.0f, rect.Width);
    }

    [Fact]
    public void GetArea_ShouldCalculateCorrectly()
    {
        var rect = new Rectangle(3.0f, 4.0f);
        Assert.Equal(12.0f, rect.GetArea());
    }

    [Fact]
    public void GetPerimeter_ShouldCalculateCorrectly()
    {
        var rect = new Rectangle(3.0f, 4.0f);
        Assert.Equal(14.0f, rect.GetPerimeter());
    }
}
```

---

## Esercizio 3: La classe `Employee`

### Consegna
Crea una classe `Employee` per modellare un dipendente.
- Proprietà: `Id` (sola lettura, `int`), `FirstName` (sola lettura, `string`), `LastName` (sola lettura, `string`), `Salary` (`int`).
- Costruttore che accetta id, nome, cognome e stipendio.
- Metodo `GetFullName()` che restituisce `FirstName + " " + LastName`.
- Metodo `GetAnnualSalary()` che restituisce lo stipendio moltiplicato per 12.
- Metodo `RaiseSalary(int percent)` che aumenta lo stipendio della percentuale specificata e restituisce il nuovo stipendio.
- Override di `ToString()` nel formato `"Employee[Id=id,Name=nome cognome,Salary=salary]"`.

### Test Unitari (xUnit)

```csharp
using Xunit;

public class EmployeeTests
{
    [Fact]
    public void Employee_ShouldInitializeCorrectly()
    {
        var emp = new Employee(1, "Mario", "Rossi", 2000);
        Assert.Equal(1, emp.Id);
        Assert.Equal("Mario", emp.FirstName);
        Assert.Equal("Rossi", emp.LastName);
        Assert.Equal(2000, emp.Salary);
    }

    [Fact]
    public void GetFullName_ShouldReturnConcatenatedString()
    {
        var emp = new Employee(1, "Mario", "Rossi", 2000);
        Assert.Equal("Mario Rossi", emp.GetFullName());
    }

    [Fact]
    public void GetAnnualSalary_ShouldReturnSalaryTimes12()
    {
        var emp = new Employee(1, "Mario", "Rossi", 2000);
        Assert.Equal(24000, emp.GetAnnualSalary());
    }

    [Fact]
    public void RaiseSalary_ShouldIncreaseSalaryByPercentage()
    {
        var emp = new Employee(1, "Mario", "Rossi", 2000);
        int newSalary = emp.RaiseSalary(10); // +10% = 200
        Assert.Equal(2200, newSalary);
        Assert.Equal(2200, emp.Salary);
    }
}
```

---

## Esercizio 4: La classe `Account`

### Consegna

Crea una classe `Account`.
- Proprietà: `Id` (sola lettura, `string`), `Name` (sola lettura, `string`), `Balance` (solo lettura dall'esterno, modificabile internamente, `int`, default `0`).
- Costruttore che accetta `id` e `name` (balance = 0).
- Costruttore che accetta `id`, `name` e `balance`.
- Metodo `Credit(int amount)` che aggiunge l'importo al saldo e restituisce il saldo aggiornato.
- Metodo `Debit(int amount)`: se l'importo è minore o uguale al saldo, lo sottrae e restituisce il saldo. Altrimenti, non modifica il saldo, stampa in console "Amount exceeded balance" e restituisce il saldo originale.
- Metodo `TransferTo(Account another, int amount)`: preleva l'importo dal conto corrente (se sufficiente) e lo accredita al conto `another`. Restituisce il saldo aggiornato del conto corrente.
- Override `ToString()` in formato `"Account[Id=id,Name=name,Balance=balance]"`.

### Test Unitari (xUnit)

```csharp
using Xunit;

public class AccountTests
{
    [Fact]
    public void Credit_ShouldIncreaseBalance()
    {
        var acc = new Account("A1", "Luigi", 100);
        acc.Credit(50);
        Assert.Equal(150, acc.Balance);
    }

    [Fact]
    public void Debit_WhenSufficientFunds_ShouldDecreaseBalance()
    {
        var acc = new Account("A1", "Luigi", 100);
        acc.Debit(40);
        Assert.Equal(60, acc.Balance);
    }

    [Fact]
    public void Debit_WhenInsufficientFunds_ShouldNotChangeBalance()
    {
        var acc = new Account("A1", "Luigi", 100);
        acc.Debit(150);
        Assert.Equal(100, acc.Balance);
    }

    [Fact]
    public void TransferTo_WhenSufficientFunds_ShouldUpdateBothBalances()
    {
        var acc1 = new Account("A1", "Luigi", 200);
        var acc2 = new Account("A2", "Anna", 50);
        
        acc1.TransferTo(acc2, 100);
        
        Assert.Equal(100, acc1.Balance);
        Assert.Equal(150, acc2.Balance);
    }
}
```