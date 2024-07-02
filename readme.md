# Blocca-IA Script PowerShell

Questo script PowerShell blocca gli indirizzi IP delle intelligenze artificiali aggiungendo record al file `hosts` del tuo sistema. In questo modo, gli indirizzi specificati verranno reindirizzati all'indirizzo di loopback `127.0.0.1`, impedendo l'accesso ai servizi AI.

## Prerequisiti

- Windows PowerShell
- Privilegi di amministratore

## Istruzioni per l'uso:

1. Salva il contenuto di blocca-ai.ps1 in un file denominato `blocca-ai.ps1` sul Desktop.

2. Modifica la politica di esecuzione degli script
Per eseguire lo script, potrebbe essere necessario modificare la politica di esecuzione degli script di PowerShell:

Apri PowerShell come amministratore.
Esegui i seguenti comandi:

```powershell
Set-ExecutionPolicy RemoteSigned
cd C:\Users\tuo_username\Desktop
.\blocca-ai.ps1
Set-ExecutionPolicy Restricted
```