output "redis_clusters_id" {
  description = "Map of id values across all redis_clusters, keyed the same as var.redis_clusters except keys with no id are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "redis_clusters_acl_policy" {
  description = "Map of acl_policy values across all redis_clusters, keyed the same as var.redis_clusters except keys with no acl_policy are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.acl_policy if v.acl_policy != null && length(v.acl_policy) > 0 }
}
output "redis_clusters_authorization_mode" {
  description = "Map of authorization_mode values across all redis_clusters, keyed the same as var.redis_clusters except keys with no authorization_mode are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.authorization_mode if v.authorization_mode != null && length(v.authorization_mode) > 0 }
}
output "redis_clusters_automated_backup_config" {
  description = "Map of automated_backup_config values across all redis_clusters, keyed the same as var.redis_clusters except keys with no automated_backup_config are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.automated_backup_config) if v.automated_backup_config != null && length(v.automated_backup_config) > 0 }
}
output "redis_clusters_available_maintenance_versions" {
  description = "Map of available_maintenance_versions values across all redis_clusters, keyed the same as var.redis_clusters except keys with no available_maintenance_versions are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.available_maintenance_versions if v.available_maintenance_versions != null && length(v.available_maintenance_versions) > 0 }
}
output "redis_clusters_backup_collection" {
  description = "Map of backup_collection values across all redis_clusters, keyed the same as var.redis_clusters except keys with no backup_collection are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.backup_collection if v.backup_collection != null && length(v.backup_collection) > 0 }
}
output "redis_clusters_create_time" {
  description = "Map of create_time values across all redis_clusters, keyed the same as var.redis_clusters except keys with no create_time are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "redis_clusters_cross_cluster_replication_config" {
  description = "Map of cross_cluster_replication_config values across all redis_clusters, keyed the same as var.redis_clusters except keys with no cross_cluster_replication_config are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.cross_cluster_replication_config) if v.cross_cluster_replication_config != null && length(v.cross_cluster_replication_config) > 0 }
}
output "redis_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all redis_clusters, keyed the same as var.redis_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "redis_clusters_deletion_protection_enabled" {
  description = "Map of deletion_protection_enabled values across all redis_clusters, keyed the same as var.redis_clusters except keys with no deletion_protection_enabled are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.deletion_protection_enabled if v.deletion_protection_enabled != null }
}
output "redis_clusters_discovery_endpoints" {
  description = "Map of discovery_endpoints values across all redis_clusters, keyed the same as var.redis_clusters except keys with no discovery_endpoints are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.discovery_endpoints if v.discovery_endpoints != null && length(v.discovery_endpoints) > 0 }
}
output "redis_clusters_effective_labels" {
  description = "Map of effective_labels values across all redis_clusters, keyed the same as var.redis_clusters except keys with no effective_labels are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "redis_clusters_effective_maintenance_version" {
  description = "Map of effective_maintenance_version values across all redis_clusters, keyed the same as var.redis_clusters except keys with no effective_maintenance_version are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.effective_maintenance_version if v.effective_maintenance_version != null && length(v.effective_maintenance_version) > 0 }
}
output "redis_clusters_gcs_source" {
  description = "Map of gcs_source values across all redis_clusters, keyed the same as var.redis_clusters except keys with no gcs_source are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.gcs_source) if v.gcs_source != null && length(v.gcs_source) > 0 }
}
output "redis_clusters_is_acl_policy_in_sync" {
  description = "Map of is_acl_policy_in_sync values across all redis_clusters, keyed the same as var.redis_clusters except keys with no is_acl_policy_in_sync are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.is_acl_policy_in_sync if v.is_acl_policy_in_sync != null }
}
output "redis_clusters_kms_key" {
  description = "Map of kms_key values across all redis_clusters, keyed the same as var.redis_clusters except keys with no kms_key are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.kms_key if v.kms_key != null && length(v.kms_key) > 0 }
}
output "redis_clusters_labels" {
  description = "Map of labels values across all redis_clusters, keyed the same as var.redis_clusters except keys with no labels are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "redis_clusters_maintenance_policy" {
  description = "Map of maintenance_policy values across all redis_clusters, keyed the same as var.redis_clusters except keys with no maintenance_policy are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.maintenance_policy) if v.maintenance_policy != null && length(v.maintenance_policy) > 0 }
}
output "redis_clusters_maintenance_schedule" {
  description = "Map of maintenance_schedule values across all redis_clusters, keyed the same as var.redis_clusters except keys with no maintenance_schedule are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.maintenance_schedule if v.maintenance_schedule != null && length(v.maintenance_schedule) > 0 }
}
output "redis_clusters_maintenance_version" {
  description = "Map of maintenance_version values across all redis_clusters, keyed the same as var.redis_clusters except keys with no maintenance_version are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.maintenance_version if v.maintenance_version != null && length(v.maintenance_version) > 0 }
}
output "redis_clusters_managed_backup_source" {
  description = "Map of managed_backup_source values across all redis_clusters, keyed the same as var.redis_clusters except keys with no managed_backup_source are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.managed_backup_source) if v.managed_backup_source != null && length(v.managed_backup_source) > 0 }
}
output "redis_clusters_managed_server_ca" {
  description = "Map of managed_server_ca values across all redis_clusters, keyed the same as var.redis_clusters except keys with no managed_server_ca are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.managed_server_ca if v.managed_server_ca != null && length(v.managed_server_ca) > 0 }
}
output "redis_clusters_name" {
  description = "Map of name values across all redis_clusters, keyed the same as var.redis_clusters except keys with no name are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "redis_clusters_node_type" {
  description = "Map of node_type values across all redis_clusters, keyed the same as var.redis_clusters except keys with no node_type are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.node_type if v.node_type != null && length(v.node_type) > 0 }
}
output "redis_clusters_persistence_config" {
  description = "Map of persistence_config values across all redis_clusters, keyed the same as var.redis_clusters except keys with no persistence_config are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.persistence_config) if v.persistence_config != null && length(v.persistence_config) > 0 }
}
output "redis_clusters_precise_size_gb" {
  description = "Map of precise_size_gb values across all redis_clusters, keyed the same as var.redis_clusters except keys with no precise_size_gb are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.precise_size_gb if v.precise_size_gb != null }
}
output "redis_clusters_project" {
  description = "Map of project values across all redis_clusters, keyed the same as var.redis_clusters except keys with no project are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.project if v.project != null && length(v.project) > 0 }
}
output "redis_clusters_psc_configs" {
  description = "Map of psc_configs values across all redis_clusters, keyed the same as var.redis_clusters except keys with no psc_configs are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.psc_configs if v.psc_configs != null && length(v.psc_configs) > 0 }
}
output "redis_clusters_psc_connections" {
  description = "Map of psc_connections values across all redis_clusters, keyed the same as var.redis_clusters except keys with no psc_connections are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.psc_connections if v.psc_connections != null && length(v.psc_connections) > 0 }
}
output "redis_clusters_psc_service_attachments" {
  description = "Map of psc_service_attachments values across all redis_clusters, keyed the same as var.redis_clusters except keys with no psc_service_attachments are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.psc_service_attachments if v.psc_service_attachments != null && length(v.psc_service_attachments) > 0 }
}
output "redis_clusters_redis_configs" {
  description = "Map of redis_configs values across all redis_clusters, keyed the same as var.redis_clusters except keys with no redis_configs are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.redis_configs if v.redis_configs != null && length(v.redis_configs) > 0 }
}
output "redis_clusters_region" {
  description = "Map of region values across all redis_clusters, keyed the same as var.redis_clusters except keys with no region are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.region if v.region != null && length(v.region) > 0 }
}
output "redis_clusters_replica_count" {
  description = "Map of replica_count values across all redis_clusters, keyed the same as var.redis_clusters except keys with no replica_count are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.replica_count if v.replica_count != null }
}
output "redis_clusters_server_ca_mode" {
  description = "Map of server_ca_mode values across all redis_clusters, keyed the same as var.redis_clusters except keys with no server_ca_mode are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.server_ca_mode if v.server_ca_mode != null && length(v.server_ca_mode) > 0 }
}
output "redis_clusters_server_ca_pool" {
  description = "Map of server_ca_pool values across all redis_clusters, keyed the same as var.redis_clusters except keys with no server_ca_pool are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.server_ca_pool if v.server_ca_pool != null && length(v.server_ca_pool) > 0 }
}
output "redis_clusters_shard_count" {
  description = "Map of shard_count values across all redis_clusters, keyed the same as var.redis_clusters except keys with no shard_count are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.shard_count if v.shard_count != null }
}
output "redis_clusters_size_gb" {
  description = "Map of size_gb values across all redis_clusters, keyed the same as var.redis_clusters except keys with no size_gb are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.size_gb if v.size_gb != null }
}
output "redis_clusters_state" {
  description = "Map of state values across all redis_clusters, keyed the same as var.redis_clusters except keys with no state are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "redis_clusters_state_info" {
  description = "Map of state_info values across all redis_clusters, keyed the same as var.redis_clusters except keys with no state_info are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.state_info if v.state_info != null && length(v.state_info) > 0 }
}
output "redis_clusters_terraform_labels" {
  description = "Map of terraform_labels values across all redis_clusters, keyed the same as var.redis_clusters except keys with no terraform_labels are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "redis_clusters_transit_encryption_mode" {
  description = "Map of transit_encryption_mode values across all redis_clusters, keyed the same as var.redis_clusters except keys with no transit_encryption_mode are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.transit_encryption_mode if v.transit_encryption_mode != null && length(v.transit_encryption_mode) > 0 }
}
output "redis_clusters_uid" {
  description = "Map of uid values across all redis_clusters, keyed the same as var.redis_clusters except keys with no uid are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "redis_clusters_zone_distribution_config" {
  description = "Map of zone_distribution_config values across all redis_clusters, keyed the same as var.redis_clusters except keys with no zone_distribution_config are omitted"
  value       = { for k, v in google_redis_cluster.redis_clusters : k => one(v.zone_distribution_config) if v.zone_distribution_config != null && length(v.zone_distribution_config) > 0 }
}

