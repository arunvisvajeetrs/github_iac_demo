# Terraform GitHub Repo Management

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
  _Homebrew installs Terraform faster than macOS nags you for the next OS update._

- **Windows:**
Download the installer from Terraform Releases.
_Yes, Windows will ask you 3 “Are you sure?” dialogs and maybe reboot twice — just normal Windows fun._
    
- **Linux:**
`sudo apt-get install terraform`_Or you probably already compiled it from source last week._
    

### 2\. GitHub Repository

*   Create a GitHub repository (or use an existing one)
    
*   Use the Terraform .gitignore template to avoid committing state files or secrets 
_Trust me, committing your terraform.tfstate is career suicide._
    

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
    git clone https://github.com//.gitcd
    ```
    
2.  
   ```bash
   terraform init
   ```
    
3.  
    ```bash
    terraform plan -out=plan.outterraform show -no-color plan.out > plan.txt
    ```
4.  
    ```bash
    terraform apply plan.out
    ```   

> ⚠️ Always review terraform plan before applying. It can modify repository settings, branch protections, and custom variables.