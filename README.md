# Terraform Azure VM — CI/CD Lab

Deploy a basic Ubuntu 22.04 Azure VM using Terraform and GitHub Actions.

## Prerequisites
- Azure account with an active subscription
- GitHub repository
- Azure CLI installed locally

## Quick Start

### 1. Create Azure Service Principal
```bash
az login

az ad sp create-for-rbac \
  --name "sp-github-terraform" \
  --role Contributor \
  --scopes /subscriptions/<YOUR_SUBSCRIPTION_ID> \
  --sdk-auth
```

Save the output — you'll need the four values below.

### 2. Add GitHub Secrets
Go to: **Repo → Settings → Secrets and variables → Actions → New repository secret**

| Secret Name              | Value                        |
|--------------------------|------------------------------|
| `ARM_CLIENT_ID`          | `clientId` from sp output    |
| `ARM_CLIENT_SECRET`      | `clientSecret` from sp output|
| `ARM_SUBSCRIPTION_ID`    | `subscriptionId`             |
| `ARM_TENANT_ID`          | `tenantId`                   |
| `TF_VAR_admin_password`  | VM password (min 12 chars)   |

### 3. Push to GitHub
```bash
git init
git add .
git commit -m "Initial Terraform lab"
git remote add origin https://github.com/<your-username>/terraform-azure-vm.git
git push -u origin main
```

### 4. Watch it run
Go to the **Actions** tab in your GitHub repo.
- Pull requests → runs `terraform plan` only
- Push to `main` → runs `terraform apply` and deploys the VM

## Cleanup
```bash
terraform destroy
```

> **Cost:** Standard_B1s ~$0.01/hr. Destroy after the lab!

## File Structure
```
terraform-azure-vm/
├── .github/
│   └── workflows/
│       └── terraform.yml   ← CI/CD pipeline
├── main.tf                 ← All Azure resources
├── variables.tf            ← Input variables
├── outputs.tf              ← VM name + public IP
├── terraform.tfvars        ← Non-secret values
├── .gitignore
└── README.md
```
