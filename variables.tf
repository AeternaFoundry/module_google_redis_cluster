variable "redis_clusters" {
  description = <<EOT
Map of redis_clusters, attributes below
Required:
    - shard_count
Optional:
    - acl_policy
    - authorization_mode
    - deletion_policy
    - deletion_protection_enabled
    - kms_key
    - labels
    - maintenance_version
    - name
    - node_type
    - project
    - redis_configs
    - region
    - replica_count
    - server_ca_mode
    - server_ca_pool
    - transit_encryption_mode
    - automated_backup_config (block):
        - fixed_frequency_schedule (required, block):
            - start_time (required, block):
                - hours (required)
        - retention (required)
    - cross_cluster_replication_config (block):
        - cluster_role (optional)
        - primary_cluster (optional, block):
            - cluster (optional)
        - secondary_clusters (optional, block):
            - cluster (optional)
    - gcs_source (block):
        - uris (required)
    - maintenance_policy (block):
        - weekly_maintenance_window (optional, block):
            - day (required)
            - start_time (required, block):
                - hours (optional)
                - minutes (optional)
                - nanos (optional)
                - seconds (optional)
    - managed_backup_source (block):
        - backup (required)
    - persistence_config (block):
        - aof_config (optional, block):
            - append_fsync (optional)
        - mode (optional)
        - rdb_config (optional, block):
            - rdb_snapshot_period (optional)
            - rdb_snapshot_start_time (optional)
    - psc_configs (block):
        - network (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
    - zone_distribution_config (block):
        - mode (optional)
        - zone (optional)
EOT

  type = map(object({
    shard_count                 = number
    acl_policy                  = optional(string)
    authorization_mode          = optional(string)
    deletion_policy             = optional(string)
    deletion_protection_enabled = optional(bool)
    kms_key                     = optional(string)
    labels                      = optional(map(string))
    maintenance_version         = optional(string)
    name                        = optional(string)
    node_type                   = optional(string)
    project                     = optional(string)
    redis_configs               = optional(map(string))
    region                      = optional(string)
    replica_count               = optional(number)
    server_ca_mode              = optional(string)
    server_ca_pool              = optional(string)
    transit_encryption_mode     = optional(string)
    automated_backup_config = optional(object({
      fixed_frequency_schedule = object({
        start_time = object({
          hours = number
        })
      })
      retention = string
    }))
    cross_cluster_replication_config = optional(object({
      cluster_role = optional(string)
      primary_cluster = optional(object({
        cluster = optional(string)
      }))
      secondary_clusters = optional(list(object({
        cluster = optional(string)
      })))
    }))
    gcs_source = optional(object({
      uris = set(string)
    }))
    maintenance_policy = optional(object({
      weekly_maintenance_window = optional(list(object({
        day = string
        start_time = object({
          hours   = optional(number)
          minutes = optional(number)
          nanos   = optional(number)
          seconds = optional(number)
        })
      })))
    }))
    managed_backup_source = optional(object({
      backup = string
    }))
    persistence_config = optional(object({
      aof_config = optional(object({
        append_fsync = optional(string)
      }))
      mode = optional(string)
      rdb_config = optional(object({
        rdb_snapshot_period     = optional(string)
        rdb_snapshot_start_time = optional(string)
      }))
    }))
    psc_configs = optional(list(object({
      network = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
    zone_distribution_config = optional(object({
      mode = optional(string)
      zone = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.redis_clusters : (
        v.maintenance_policy == null || (v.maintenance_policy.weekly_maintenance_window == null || alltrue([for item in v.maintenance_policy.weekly_maintenance_window : (item.start_time.hours == null || (item.start_time.hours >= 0 && item.start_time.hours <= 23))]))
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.redis_clusters : (
        v.maintenance_policy == null || (v.maintenance_policy.weekly_maintenance_window == null || alltrue([for item in v.maintenance_policy.weekly_maintenance_window : (item.start_time.minutes == null || (item.start_time.minutes >= 0 && item.start_time.minutes <= 59))]))
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.redis_clusters : (
        v.maintenance_policy == null || (v.maintenance_policy.weekly_maintenance_window == null || alltrue([for item in v.maintenance_policy.weekly_maintenance_window : (item.start_time.nanos == null || (item.start_time.nanos >= 0 && item.start_time.nanos <= 999999999))]))
      )
    ])
    error_message = "must be between 0 and 999999999"
  }
  validation {
    condition = alltrue([
      for k, v in var.redis_clusters : (
        v.maintenance_policy == null || (v.maintenance_policy.weekly_maintenance_window == null || alltrue([for item in v.maintenance_policy.weekly_maintenance_window : (item.start_time.seconds == null || (item.start_time.seconds >= 0 && item.start_time.seconds <= 60))]))
      )
    ])
    error_message = "must be between 0 and 60"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

