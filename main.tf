resource "google_redis_cluster" "redis_clusters" {
  for_each = var.redis_clusters

  shard_count                 = each.value.shard_count
  acl_policy                  = each.value.acl_policy
  authorization_mode          = each.value.authorization_mode
  deletion_policy             = each.value.deletion_policy
  deletion_protection_enabled = each.value.deletion_protection_enabled
  kms_key                     = each.value.kms_key
  labels                      = each.value.labels
  maintenance_version         = each.value.maintenance_version
  name                        = each.value.name
  node_type                   = each.value.node_type
  project                     = each.value.project
  redis_configs               = each.value.redis_configs
  region                      = each.value.region
  replica_count               = each.value.replica_count
  server_ca_mode              = each.value.server_ca_mode
  server_ca_pool              = each.value.server_ca_pool
  transit_encryption_mode     = each.value.transit_encryption_mode

  dynamic "automated_backup_config" {
    for_each = each.value.automated_backup_config != null ? [each.value.automated_backup_config] : []
    content {
      fixed_frequency_schedule {
        start_time {
          hours = automated_backup_config.value.fixed_frequency_schedule.start_time.hours
        }
      }
      retention = automated_backup_config.value.retention
    }
  }

  dynamic "cross_cluster_replication_config" {
    for_each = each.value.cross_cluster_replication_config != null ? [each.value.cross_cluster_replication_config] : []
    content {
      cluster_role = cross_cluster_replication_config.value.cluster_role
      dynamic "primary_cluster" {
        for_each = cross_cluster_replication_config.value.primary_cluster != null ? [cross_cluster_replication_config.value.primary_cluster] : []
        content {
          cluster = primary_cluster.value.cluster
        }
      }
      dynamic "secondary_clusters" {
        for_each = cross_cluster_replication_config.value.secondary_clusters != null ? cross_cluster_replication_config.value.secondary_clusters : []
        content {
          cluster = secondary_clusters.value.cluster
        }
      }
    }
  }

  dynamic "gcs_source" {
    for_each = each.value.gcs_source != null ? [each.value.gcs_source] : []
    content {
      uris = gcs_source.value.uris
    }
  }

  dynamic "maintenance_policy" {
    for_each = each.value.maintenance_policy != null ? [each.value.maintenance_policy] : []
    content {
      dynamic "weekly_maintenance_window" {
        for_each = maintenance_policy.value.weekly_maintenance_window != null ? maintenance_policy.value.weekly_maintenance_window : []
        content {
          day = weekly_maintenance_window.value.day
          start_time {
            hours   = weekly_maintenance_window.value.start_time.hours
            minutes = weekly_maintenance_window.value.start_time.minutes
            nanos   = weekly_maintenance_window.value.start_time.nanos
            seconds = weekly_maintenance_window.value.start_time.seconds
          }
        }
      }
    }
  }

  dynamic "managed_backup_source" {
    for_each = each.value.managed_backup_source != null ? [each.value.managed_backup_source] : []
    content {
      backup = managed_backup_source.value.backup
    }
  }

  dynamic "persistence_config" {
    for_each = each.value.persistence_config != null ? [each.value.persistence_config] : []
    content {
      dynamic "aof_config" {
        for_each = persistence_config.value.aof_config != null ? [persistence_config.value.aof_config] : []
        content {
          append_fsync = aof_config.value.append_fsync
        }
      }
      mode = persistence_config.value.mode
      dynamic "rdb_config" {
        for_each = persistence_config.value.rdb_config != null ? [persistence_config.value.rdb_config] : []
        content {
          rdb_snapshot_period     = rdb_config.value.rdb_snapshot_period
          rdb_snapshot_start_time = rdb_config.value.rdb_snapshot_start_time
        }
      }
    }
  }

  dynamic "psc_configs" {
    for_each = each.value.psc_configs != null ? each.value.psc_configs : []
    content {
      network = psc_configs.value.network
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }

  dynamic "zone_distribution_config" {
    for_each = each.value.zone_distribution_config != null ? [each.value.zone_distribution_config] : []
    content {
      mode = zone_distribution_config.value.mode
      zone = zone_distribution_config.value.zone
    }
  }
}

