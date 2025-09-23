# Azure SQL Database Lab

## Steps
1. Created Resource Group → `az group create ...`
2. Created SQL Server → `az sql server create ...`
3. Configured firewall rule.
4. Deployed `sampledb`.
5. Connected with Azure Data Studio.
6. Ran CRUD queries on Students table.

## Screenshots
- Connected in ADS
![azure data studio login screen](screenshots/ADS-login.jpg)
- CRUD Results
![create,read,update,delete query](screenshots/ADS-query.jpg)

### Connection issue
- Connect with your full domain "<your-server-name>.database.windows.net"
