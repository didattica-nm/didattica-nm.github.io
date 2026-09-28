# 1. Crea cartella radice ed entra
mkdir CryptoLib && cd CryptoLib

# Crea la soluzione
dotnet new sln -n BlaisePascal.5F.CryptoLib

# 2. Creazione cartelle principali
mkdir src test docs

# 3. Creazione progetti (classlib e xunit)
dotnet new classlib -n BlaisePascal.5F.CryptoLib.Domain -o src/BlaisePascal.5F.CryptoLib.Domain
dotnet new xunit -n BlaisePascal.5F.CryptoLib.Domain.UnitTests -o test/BlaisePascal.5F.CryptoLib.Domain.UnitTests

# 4. Aggiunta dei progetti alla soluzione con relative solution-folder
dotnet sln add src/BlaisePascal.5F.CryptoLib.Domain/BlaisePascal.5F.CryptoLib.Domain.csproj --solution-folder src
dotnet sln add test/BlaisePascal.5F.CryptoLib.Domain.UnitTests/BlaisePascal.5F.CryptoLib.Domain.UnitTests.csproj --solution-folder test

# 5. Collegamento del progetto di test al dominio
dotnet add test/BlaisePascal.5F.CryptoLib.Domain.UnitTests/BlaisePascal.5F.CryptoLib.Domain.UnitTests.csproj reference src/BlaisePascal.5F.CryptoLib.Domain/BlaisePascal.5F.CryptoLib.Domain.csproj

# 6. Ripristino, compilazione ed esecuzione dei test
dotnet restore
dotnet build
dotnet test