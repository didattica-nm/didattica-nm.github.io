Il seguente contenuto è pensato per coloro che vogliono slegarsi da interfacce grafiche e lavorare tramite command line. Si da per scontata la conoscenza dei comandi base di `bash`.

## Obiettivo

Creare un progetto C# `classlib` (+ relativi unit tests).

## Brevi richiami ai concetti base: soluzione e progetto

Ricordiamo che in dotnet esistono i concetti di **file progetto** e **file soluzione**.

- Un file soluzione (*estensione* `.sln`) non è altro che un raccoglitore di progetti. Gestisce le dipendenze dei vari progetti e le loro configurazioni.
- Un file progetto (*estensione* `.csproj`) rappresenta un componente di un'applicazione
	- ogni file progetto contiene informazioni come
		- versione del framework utilizzata
		- dipendenze e pacchetti
		- impostazioni di compilazione
		- tipo di output (*eseguibile, liberia, ecc...*)

```xml
<Project Sdk="Microsoft.NET.Sdk">  
	<PropertyGroup>    
		<TargetFramework>net7.0</TargetFramework>
		<OutputType>Library</OutputType>    
		<Nullable>enable</Nullable>    
		<ImplicitUsings>enable</ImplicitUsings>  
	</PropertyGroup>  
	
	<ItemGroup>    
		<PackageReference Include="Newtonsoft.Json" Version="13.0.3" />  
	</ItemGroup>  
	
	<ItemGroup>    
		<ProjectReference Include="..\MyProject.Core\MyProject.Core.csproj" /> 
	</ItemGroup>
</Project>
```


## Step-by-step

*Siamo in un terminale posizionato sulla cartella in cui vogliamo creare nuovi progetti*

### (1) Crea cartella radice e solution.

```bash
mkdir CryptoLib
cd CryptoLib
dotnet new sln -n BlaisePascal.5F.CryptoLib
```

### (2) Creazione cartelle principali

```bash
mkdir src test docs
```

### (3) Crea i progetti

(3.1) `classlib`

```bash
dotnet new classlib -n BlaisePascal.5F.CryptoLib.Domain -o src/BlaisePascal.5F.CryptoLib.Domain -f net9.0
```

(3.2) `xunit` (tests)

```bash
dotnet new xunit -n BlaisePascal.5F.CryptoLib.Domain.UnitTests -o
test/BlaisePascal.5F.CryptoLib.Domain.UnitTests -f net9.0
```

Note:
- `-n`: **name**, nome del progetto
- `-o`: **output**, cartella in cui posizionare il progetto
- `-f`: versione del framework dotnet.
### (4) Aggiunta dei progetti alle cartelle della soluzione

(4.1) Con riferimento a solution-folder `src`

```bash
dotnet sln add src/BlaisePascal.5F.CryptoLib.Domain/BlaisePascal.5F.CryptoLib.Domain.csproj --solution-folder src
```

(4.2) Con riferimento a solution-folder `test`

```bash
dotnet sln add src/BlaisePascal.5F.CryptoLib.Domain.UnitTests/BlaisePascal.5F.CryptoLib.Domain.UnitTests.csproj 
--solution-folder test
```

Hint: Con solution-folder si intende cartelle appartenenti alla soluzione, quelle create al punto (2)

### (5) Collegamento test ai progetti da testare

Così rendo visibile il progetto "Domain" al progetto "UnitTests", ovvero posso utilizzare le classi del primo nel secondo.

```bash
dotnet add test/BlaisePascal.5F.CryptoLib.Domain.UnitTests/BlaisePascal.5F.CryptoLib.Domain.UnitTests.csproj 
reference src/BlaisePascal.5F.CryptoLib.Domain/BlaisePascal.5F.CryptoLib.Domain.csproj
```

### (6) Primo avvio

```bash
dotnet restore
# (Scarica e prepara tutte le dipendenze NuGet 
# necessarie per compilare il progetto/soluzione)

dotnet build
# (Compila il codice e produce l’output (DLL, PDB, ecc.) 
# per esecuzione o test)

dotnet test
# (compila ed esegue tutti i test automatici 
# in un progetto o soluzione .NET)
```

## File pronto

- [setup.sh](setup.sh)

Hint: si può parametrizzare!

---
## Fonti

- Uno speciale ringraziamento al prof. **Luca Pulga**, che per primo ha creato gran parte di questo materiale.
- Sito web "*Compile N Run*", pagina "[.NET Project Structure](https://www.compilenrun.com/docs/framework/dotnet/net-fundamentals/net-project-structure)".