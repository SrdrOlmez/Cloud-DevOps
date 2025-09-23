
## Steps

1. **Setup NSG**
   - Run `nsg-setup.sh`
   - Creates NSG and adds inbound rules for SSH (22) and HTTP (80)
   - Attaches NSG to VM NIC

2. **Setup Blob Storage**
   - Run `blob-storage.sh`
   - Creates container if not exists
   - Uploads `hello.txt` and downloads it as `hello_download.txt`
   - Generates a SAS URL for secure temporary access

3. **Verify**
   - Open `hello_download.txt` to confirm content
   - Test SAS URL in browser or using `curl`

## Learning Goals

- Understand NSG rules, priorities, and attachments
- Learn basic blob operations via Azure CLI
- Practice secure access with SAS URLs
- Save CLI outputs and document them for labs

## Notes

- All sensitive information like subscription ID, VM names, and keys are masked or templates used.
