# devops-helpers

1. [Usage](#usage)
2. [Google Cloud](#create-or-select-a-google-cloud-project)
    2.1 [Connect to the VM instance](#connect-to-the-vm-instance)
3. [Terraform](#terraform)
  

## Usage

### Clone repository 
```bash
git clone https://github.com/stas-polos/devops-helpers.git
```

### Change into the project directory. Dev environment will be used
```bash
cd devops-helpers/envs/dev
```

To apply all resources, you need to run the following commands:
```bash
export PROJECT_ID=<project_id>                                                         # project_id: Project ID to create resources in.
export BIGQUERY_DATASET_ID=<bigquery_dataset_id>                                       # dataset_id: Dataset id for BigQuery.

terraform init                                                                         # Initialize Terraform.
terraform plan -var=project_id=${PROJECT_ID} -var=dataset_id=${BIGQUERY_DATASET_ID}    # Plan Terraform execution.
terraform apply -var=project_id=${PROJECT_ID} -var=dataset_id=${BIGQUERY_DATASET_ID}   # Apply change.
terraform destroy -var=project_id=${PROJECT_ID} -var=dataset_id=${BIGQUERY_DATASET_ID} # Destroy infustructure. 
```

## Google Cloud

### Create or select a Google Cloud project.

- Create a Google Cloud project:
```bash
gcloud projects create PROJECT_ID
```
Replace PROJECT_ID with a name for the Google Cloud project you are creating.

- Select the Google Cloud project that you created:
```bash
gcloud config set project PROJECT_ID
```
Replace PROJECT_ID with your Google Cloud project name.

For get lists of all projects
```bash
gcloud projects list
```
Example result:
```bash
PROJECT_ID                NAME              PROJECT_NUMBER
dataops-472222            DataOps           505858046112
```

- Enable the Compute Engine API:
```bash
gcloud services enable compute.googleapis.com
```
Example result:
```bash
Operation "operations/acf.p2-505858046112-af161d52-5ac3-4a94-bffc-42ad71d1fcd4" finished successfully.
```

- Grant roles to your user account. Run the following command once for each of the following IAM roles: roles/compute.instanceAdmin.v1
```bash
gcloud projects add-iam-policy-binding PROJECT_ID --member="user:USER_IDENTIFIER" --role=ROLE
```

Replace the following:
    - `PROJECT_ID`: your project ID.

    - `USER_IDENTIFIER`: the identifier for your user account.
    
    - `ROLE`: the IAM role that you grant to your user account.

Example result:
```bash
Updated IAM policy for project [dataops-472222].
bindings:
- members:
  - user:USER_IDENTIFIER # stub
  role: roles/compute.instanceAdmin.v1
- members:
  - serviceAccount:service-505858046112@compute-system.iam.gserviceaccount.com
  role: roles/compute.serviceAgent
- members:
  - serviceAccount:505858046112-compute@developer.gserviceaccount.com
  - serviceAccount:505858046112@cloudservices.gserviceaccount.com
  role: roles/editor
- members:
  - user:USER_IDENTIFIER # stub
  role: roles/owner
etag: BwY_BH-h9SQ=
version: 1
```

Helper commands:
- `gcloud compute instances list --project ${PROJECT_ID}` - Get list a vms.
- `bq ls --project_id=${PROJECT_ID}` - Get list a datasets.
- `gcloud storage buckets list --project ${PROJECT_ID} --format=json` - Get list a buckets.

## Terraform
Fow manage infrastructure, project (repo) are divided into [modules](#https://developer.hashicorp.com/terraform/tutorials/modules/module) to encapsulate all configuration files.
```bash
devops-helpers/
├── modules/
│   ├── gcs_bucket/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── bigquery_dataset/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── vm_instance/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── envs/
    └── dev/
        ├── backend.tf
        ├── provider.tf
        ├── variables.tf
        └── main.tf
```
