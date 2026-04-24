# Terraform Execution Logs

## 1. terraform init

```
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Installing hashicorp/aws v5.100.0...
- Installed hashicorp/aws v5.100.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

---

## 2. terraform validate

```
Success! The configuration is valid.
```

---

## 3. terraform plan -var-file=dev.tfvars

```
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.main will be created
  + resource "aws_s3_bucket" "main" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "myapp-dev-uploads"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Project"     = "myapp"
        }
      + tags_all                    = {
          + "Environment" = "dev"
          + "ManagedBy"   = "terraform"
          + "Project"     = "myapp"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)
      + grant (known after apply)
      + lifecycle_rule (known after apply)
      + logging (known after apply)
      + object_lock_configuration (known after apply)
      + replication_configuration (known after apply)
      + server_side_encryption_configuration (known after apply)
      + versioning (known after apply)
      + website (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_arn  = (known after apply)
  + bucket_name = "myapp-dev-uploads"
```

**Bucket name en el plan: `myapp-dev-uploads`**
**Expresion en locals.tf: `"${var.project_name}-${var.environment}-${var.bucket_suffix}"` = `"myapp-dev-uploads"`**
**Coinciden: SI**

---

## 4. terraform plan -var-file=prod.tfvars

```
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_s3_bucket.main will be created
  + resource "aws_s3_bucket" "main" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "myapp-prod-assets"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "prod"
          + "ManagedBy"   = "terraform"
          + "Project"     = "myapp"
        }
      + tags_all                    = {
          + "Environment" = "prod"
          + "ManagedBy"   = "terraform"
          + "Project"     = "myapp"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + cors_rule (known after apply)
      + grant (known after apply)
      + lifecycle_rule (known after apply)
      + logging (known after apply)
      + object_lock_configuration (known after apply)
      + replication_configuration (known after apply)
      + server_side_encryption_configuration (known after apply)
      + versioning (known after apply)
      + website (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bucket_arn  = (known after apply)
  + bucket_name = "myapp-prod-assets"
```

**Bucket name en el plan: `myapp-prod-assets`**
**Expresion en locals.tf: `"${var.project_name}-${var.environment}-${var.bucket_suffix}"` = `"myapp-prod-assets"`**
**Coinciden: SI**

---

## 5. Test de validacion: terraform plan -var-file=dev.tfvars -var="environment=staging"

```
Planning failed. Terraform encountered an error while generating this plan.

Error: Invalid value for variable

  on variables.tf line 1:
   1: variable "environment" {
      var.environment is "staging"

The environment must be either "dev" or "prod".

This was checked by the validation rule at variables.tf:5,3-13.
```

**Resultado: La validacion rechaza correctamente el valor "staging" con un mensaje claro.**
