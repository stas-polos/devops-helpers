## devops-helpers

1. [Google Cloud](#create-or-select-a-google-cloud-project)
  1. 2 [Connect to the VM instance](#connect-to-the-vm-instance)
2. [Terraform](#terraform)
  

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

# when success
# PROJECT_ID                NAME              PROJECT_NUMBER
# dataops-472222            DataOps           505858046112
```

- Enable the Compute Engine API:
```bash
gcloud services enable compute.googleapis.com

# when success: 
# Operation "operations/acf.p2-505858046112-af161d52-5ac3-4a94-bffc-42ad71d1fcd4" finished successfully.
```

- Grant roles to your user account. Run the following command once for each of the following IAM roles: roles/compute.instanceAdmin.v1
```bash
gcloud projects add-iam-policy-binding PROJECT_ID --member="user:USER_IDENTIFIER" --role=ROLE
```
Replace the following:
    - `PROJECT_ID`: your project ID.
    - `USER_IDENTIFIER`: the identifier for your user account.
    - `ROLE`: the IAM role that you grant to your user account.

```bash
# when success
Updated IAM policy for project [dataops-472222].
bindings:
- members:
  - user:USER_IDENTIFIER # # stub
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

Get a list of VMs
```bash
gcloud compute instances list
```

Connect to the VM instance
```bash
gcloud compute ssh --zone=us-central1-a VM_NAME
```

#### Connect to the VM instance

Connect to the VM instance you just created by running the following command:
```bash
gcloud compute ssh --zone=us-central1-a VM_NAME
```

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
