# IaC for Github

Manage multiple GitHub repository settings using Terraform and automate workflows with GitHub Actions.  

This repository contains a demo setup to:

- Create/update repository settings
- Apply branch protection rules
- Manage custom GitHub variables
- Automate `terraform plan` and `apply` via GitHub Actions

---

## Prerequisites

Before running this demo, make sure you have the following:

### 1. Terraform Installed

You need Terraform installed locally to run this demo.

- **macOS:**  
  ```bash
  brew install terraform
  ```

- **Windows:**
Download the installer from Terraform Releases.
    
- **Linux:**
`sudo apt-get install terraform`
    

### 2\. GitHub Repository

*   Create a GitHub repository (or use an existing one)
    
*   Use the Terraform .gitignore template to avoid committing state files or secrets 

    

### 3\. GitHub Personal Access Token (PAT)

*   Generate a PAT with the following scopes:
    
    *   repo (full access to manage repository settings)
        
    *   workflow (if using GitHub Actions for Terraform apply)
        
*   Store it in GitHub Actions secrets as IAC\_GITHUB\_TOKEN_GitHub calls it 
> ⚠️ The variable should begin with `TF_VAR_` for the terraform to pick it

### 4\. VS Code (or any editor)

I use VS Code — yes, it’s open source, and somehow Microsoft hasn’t ruined it… _so far._

Running Locally
---------------

1.  
    ```bash
    git clone git@github.com:arunvisvajeetrs/github_iac_demo.git
    ```
    
2.  
   ```bash
   terraform init
   ```
    
3.  
    ```bash
    terraform plan
    ```
4.  
    ```bash
    terraform apply
    ```   

> ⚠️ Always review terraform plan before applying. It can modify repository settings, branch protections, and custom variables.
