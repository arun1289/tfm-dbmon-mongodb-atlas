# The project ID for MongoDB Atlas
variable "atlas_projectid" {
  description = "The project id for MongoDB Atlas"
  default = null
  type = string
}

#The event type variable for host down
variable "event_HostDown"{
  description = "The specific host down event type"
  default = "HOST_DOWN"
}

#The event type variable for outside metric threshold
variable "OUTSIDE_METRIC_THRESHOLD"{
  description = "Metric occurred outside of the metric threshold"
  default = "OUTSIDE_METRIC_THRESHOLD"
}

#The event type variable for when replica set has no primary
variable "NO_PRIMARY"{
  description = "Replica set has no primary"
  default = "NO_PRIMARY"
}

#The event type variable for when replica set has too many elections
variable "TOO_MANY_ELECTIONS"{
  description = "Specifies the number of election events"
  default = "TOO_MANY_ELECTIONS"
}

# Metric name for "Cache : Dirty Bytes is"
variable "metric_name_dirty_bytes"{
  description = "Specifies the metric name for 'Cache : Dirty Bytes is ' "
  default = "CACHE_USAGE_DIRTY"
}

# Metric name for "Queues : Readers is  "
variable "metric_name_queues_readers"{
  description = "Specifies the metric name for 'Queues : Readers is'"
  default = "GLOBAL_LOCK_CURRENT_QUEUE_READERS"
}

# Metric name for "Cache : Used Bytes is"
variable "metric_name_used_bytes"{
  description = "Specifies the metric name for 'Cache : Used Bytes is' "
  default = "CACHE_USAGE_USED"
}

# Metric name for "Connection is.."
variable "metric_name_connection"{
  description = "Specifies the metric name for 'Connection is' "
  default = "CONNECTIONS"
}

# Metric name for "Connection % of confgured limit is "
variable "metric_name_connection_percen"{
  description = "Specifies the metric name for 'Connection % of confgured limit is ' "
  default = "CONNECTIONS_PERCENT"
}

#Alert Configuration Enabled?
variable "config_enabled" {
  description = "Flag indicating this alert configuration enabled."
  type        = bool
  default     = true
}

# #Notification Group type name 
# variable "notif_group"{
#   description = "Specifies notification to be sent to a Group"
#   default = "GROUP"
# }

# #Notification Email type name
# variable "notif_EMAIL"{
#   description = "Specifies notification to be sent to email addresses"
#   default = "EMAIL"
# }

# variable "notif_SMS"{
#   description = "Specifies notification to be sent to Phone number"
#   default = "SMS"
#   type = string
# }

variable "notif_user"{
  description = "Specifies notification to be sent to User name"
  default = "USER"
  type = string
}

# variable "mobile_number" {
#   default = null
#   type = string
# }

# Username variable for the User account which will get alerts
variable "username" {
  type = string
  default = null
}

# #Notification email address list
# variable "email_address"{
#   description = "List of all email address receiving notification"
#   type        = string
#   default     = null
# }

#SMS enabled?
variable "SMS_Enabled"{
  description = "Flag indicating SMS Notification to be disabled."
  type        = bool
  default     = false
}

#Email enabled?
variable "email_enabled"{
  description = "Flag indicating Email Notification to be enabled."
  type        = bool
  default     = true
}

#Notification alert reciever role
variable "notif_roles"{
  description = "Specifies the role for who should recieve notification alerts"
  type = list
  default = null
}

# CPU User metric name
variable "metric_name_CPU_user"{
  description = "Specifies the metric name for System CPU user percentage"
  default = "NORMALIZED_SYSTEM_CPU_USER"
}

# Greater than operator
variable "operator_Greater"{
  description = "Greater than operator"
  default = "GREATER_THAN"
}

# Less than operator
variable "operator_Less"{
  description = "Less than operator"
  default = "LESS_THAN"
}

# Metric threshold Units raw
variable "unit_Raw"{
  default = "RAW"
}

# Metric threshold Units bytes
variable "unit_Bytes"{
  default = "BYTES"
}

# Metric threshold Units seconds
variable "unit_Seconds"{
  default = "SECONDS"
}

# metric threshold mode
variable "mode_average"{
  default = "AVERAGE"
}

variable "units_hours" {
  default = "HOURS"
}


variable "units_days" {
  default = "DAYS"
}
#------------------------------------HOST DOWN----------------------------
#Resend the host down alerts after specified interval minutes 
variable "host_down_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 120
}

#Send the host down alerts if condition lasts specified minutes 
variable "host_down_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 5
}

#------------------------------------HOST Search process ran out of memory----------------------------
#Resend the Host System CPU alerts after specified interval minutes 
variable "host_search_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

#Send the Host System CPU alerts if condition lasts specified minutes 
variable "host_search_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#event type for Host System CPU alerts
variable "host_search_eventType" {
  default = "HOST_MONGOT_CRASHING_OOM"
}

#------------------------------------HOST SYSTEM CPU USER %----------------------------
#Resend the Host System CPU alerts after specified interval minutes 
variable "host_CPU_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

#Send the Host System CPU alerts if condition lasts specified minutes 
variable "host_CPU_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

variable "threshold_Host_CPU"{
  description = "Threshold value percentage for Host CPU percentage"
  default = 95.0
}

# Threshold value for connection
variable "threshold_connection" {
  default = 1.5
}

#------------------------------------Replication Headroom is...----------------------------
#Resend the Host Replication headroom alerts after specified interval minutes 
variable "host_headroom_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 120
}

#Send the Host Replication headroom alerts if condition lasts specified minutes 
variable "host_headroom_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 60
}

# Replication headroom threshold metric name
variable "metric_replication_headroom"{
  default = "OPLOG_MASTER_LAG_TIME_DIFF"
}

# Metric name for "Memory : Resident is  "
variable "metric_name_memory_resident"{
  description = "Specifies the metric name for 'Memory : Resident is'"
  default = "MEMORY_RESIDENT"
}

# Metric name for "Page Fault Exceptions thrown : Total is "
variable "metric_name_exception_thrown"{
  description = "Specifies the metric name for 'Page Fault Exceptions thrown : Total is '"
  default = "GLOBAL_PAGE_FAULT_EXCEPTIONS_THROWN"
}

variable "threshold_replication_headroom"{
  default = 2
}

# Threshold value for Disk Space % used on Data partition is
variable "threshold_disk_partition_data2" {
  default = 20
}

#------------------------------------HOST REPLICATION LAG----------------------------
#Resend the Host Replication lag alerts after specified interval minutes 
variable "host_Replication_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 120
}

#Send the Host Replication lag alerts if condition lasts specified minutes 
variable "host_Replication_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 60
}

# Replication lag threshold metric name
variable "metric_replication_lag"{
  default = "OPLOG_SLAVE_LAG_MASTER_TIME"
}

# threshold value for replication lag
variable "threshold_replication_lag"{
  default = 2
}


#------------------------------------REPLICA SET NO PRIMARY----------------------------
#Resend the Replica Set No primary alerts after specified interval minutes 
variable "replica_noPrimary_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

#Send the Replica Set No primary alerts if condition lasts specified minutes 
variable "replica_noPrimary_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 5
}


#------------------------------------REPLICA SET ELECTION----------------------------
#Resend the Replica Set number of election event alerts after specified interval minutes 
variable "replica_election_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 10
}

#Send the Replica Set number of election event alerts if condition lasts specified minutes 
variable "replica_election_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 1440
}

variable "threshold_replica_election"{
  default = 2
}

#------------------------------------REPLICA OPLOG WINDOW----------------------------
#Resend the Replication Oplog Window alerts after specified interval minutes 
variable "replica_oplog_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 120
}

#Send the Replication Oplog Window alerts if condition lasts specified minutes 
variable "replica_oplog_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 60
}

#event type for Replication Oplog Window alerts
variable "replica_oplog_eventType" {
  default = "REPLICATION_OPLOG_WINDOW_RUNNING_OUT"
}

# Metric name for "Queues : Total is "
variable "metric_name_queues_total"{
  description = "Specifies the metric name for 'Queues : Total is'"
  default = "GLOBAL_LOCK_CURRENT_QUEUE_TOTAL"
}

# Metric name for "Queues : Writers is "
variable "metric_name_queues_writers"{
  description = "Specifies the metric name for 'Queues : Writers is '"
  default = "GLOBAL_LOCK_CURRENT_QUEUE_TOTAL"
}

# Metric name for "Effective Lock % is"
variable "metric_name_effective_lock"{
  description = "Specifies the metric name for 'Effective Lock % is '"
  default = "GLOBAL_LOCK_PERCENTAGE"
}




#threshold value for replicarion oplog window alerts
variable "threshold_replica_oplog"{
  default = 72
}

#------------------------------------SHARDED CLUSTER MISSING MONGOS----------------------------
#Resend the Sharded cluster missing mongos alerts after specified interval minutes 
variable "cluster_mongos_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 120
}

#Send the Sharded cluster missing mongos alerts if condition lasts specified minutes 
variable "cluster_mongos_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 60
}

#event type for the Sharded cluster missing mongos alerts
variable "cluster_mongos_eventType" {
  default = "CLUSTER_MONGOS_IS_MISSING"
}

#------------------------------------CLOUD BACKUP SNAPSHOT SCHEDULE BEHIND----------------------------
# Resend the "cloud backup snapshot schedule fell behind" alerts after specified interval minutes 
variable "backup_snapshotBehind_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "cloud backup snapshot schedule fell behind" alerts if condition lasts specified minutes 
variable "backup_snapshotBehind_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#event type for "cloud backup snapshot schedule fell behind" alerts
variable "backup_snapshotBehind_eventType" {
  default = "CPS_SNAPSHOT_BEHIND"
}

#threshold value for "cloud backup snapshot schedule fell behind" alerts
variable "threshold_backup_snapshotBehind"{
  default = 2
}

#------------------------------------CLOUD BACKUP SNAPSHOT TAKEN----------------------------
# Resend the "cloud backup snapshot taken" alerts after specified interval minutes 
variable "backup_snapshotTaken_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "cloud backup snapshot taken" alerts if condition lasts specified minutes 
variable "backup_snapshotTaken_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#event type for "cloud backup snapshot taken" alerts
variable "backup_snapshotTaken_eventType" {
  default = "CPS_SNAPSHOT_FALLBACK_SUCCESSFUL"
}


#------------------------------------CLOUD BACKUP SNAPSHOT FAILED----------------------------
# Resend the "cloud backup snapshot failed" alerts after specified interval minutes 
variable "backup_snapshotFailed_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "cloud backup snapshot failed" alerts if condition lasts specified minutes 
variable "backup_snapshotFailed_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#event type for "cloud backup snapshot failed" alerts
variable "backup_snapshotFailed_eventType" {
  default = "CPS_SNAPSHOT_FALLBACK_FAILED"
}


#------------------------------------BACKUP RESTORE SUCCEEDED----------------------------
#event type for "Backup restore succeeded" alerts
variable "backup_restoreSucceed_eventType" {
  default = "CPS_RESTORE_SUCCESSFUL"
}

# Resend the "Backup restore succeeded" alerts after specified interval minutes 
variable "backup_restoreSucceed_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Backup restore succeeded" alerts if condition lasts specified minutes 
variable "backup_restoreSucceed_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#------------------------------------BACKUP RESTORE FAILED----------------------------

#event type for "Backup restore Failed" alerts
variable "backup_restoreFailed_eventType" {
  default = "CPS_RESTORE_FAILED"
}

# Resend the "Backup restore Failed" alerts after specified interval minutes 
variable "backup_restoreFailed_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Backup restore Failed" alerts if condition lasts specified minutes 
variable "backup_restoreFailed_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# #------------------------------------EXPORT SNAPSHOT FAILED----------------------------

# #event type for "Export snapshot Failed" alerts
# variable "export_snapshotFailed_eventType" {
#   default = "CPS_RESTORE_FAILED"
# }

# # Resend the "Export snapshot Failed" alerts after specified interval minutes 
# variable "export_snapshotFailed_interval_min"{
#   description = "Specifies interval time in between alert notification"
#   default = 30
# }

# # Send the "Export snapshot Failed" alerts if condition lasts specified minutes 
# variable "export_snapshotFailed_delay_min"{
#   description = "Send notification if condition lasts at least the amount of minutes specified"
#   default = 15
# }


# #------------------------------------EXPORT SNAPSHOT SUCCEEDED----------------------------
# #event type for "Export snapshot Succeeded" alerts
# variable "export_snapshotSucceeded_eventType" {
#   default = "CPS_RESTORE_FAILED"
# }

# # Resend the "Export snapshot Succeeded" alerts after specified interval minutes 
# variable "export_snapshotSucceeded_interval_min"{
#   description = "Specifies interval time in between alert notification"
#   default = 30
# }

# # Send the "Export snapshot Succeeded" alerts if condition lasts specified minutes 
# variable "export_snapshotSucceeded_delay_min"{
#   description = "Send notification if condition lasts at least the amount of minutes specified"
#   default = 15
# }


#------------------------------------BACKUP RESTORE FAILED----------------------------

#event type for "Snapshot download request failed" alerts
variable "Snapshot_downloadFailed_eventType" {
  default = "CPS_SNAPSHOT_DOWNLOAD_REQUEST_FAILED"
}

# Resend the "Snapshot download request failed" alerts after specified interval minutes 
variable "Snapshot_downloadFailed_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Snapshot download request failed" alerts if condition lasts specified minutes 
variable "Snapshot_downloadFailed_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#------------------------------------PROJECT: multi-factor authentication disabled----------------------------
# Resend the "Users do not have multi-factor authentication enabled" alerts after specified interval minutes 
variable "project_auth_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Users do not have multi-factor authentication enabled" alerts if condition lasts specified minutes 
variable "project_auth_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#------------------------------------USER: Joined the project----------------------------
#event type defined for "user joined the project" alerts
variable "user_joined_eventType" {
  default = "JOINED_GROUP"
}

#------------------------------------USER: Left the project----------------------------
#event type defined for "user left the project" alerts
variable "user_left_eventType" {
  default = "REMOVED_FROM_GROUP"
}

#------------------------------------USER: had their role changed----------------------------
#event type defined for "user had their role changed" alerts
variable "user_roleChange_eventType" {
  default = "USER_ROLES_CHANGED_AUDIT"
}

#------------------------------------BILLING: Monthly invoice----------------------------
# Resend the "Monthly pending invoice ($) total" alerts after specified interval minutes 
variable "billing_monthly_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Monthly pending invoice ($) total" alerts if condition lasts specified minutes 
variable "billing_monthly_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#Threshold value for monthly billing
variable "threshold_billing_monthly"{
  default = 100
}

#event type defined for "Monthly pending invoice" alerts
variable "user_billing_eventType" {
  default = "PENDING_INVOICE_OVER_THRESHOLD"
}

#event type defined for "FTS Processes : Diskspace used is" alerts
variable "user_fts_diskspace_eventType" {
  default = "FTS_DISK_UTILIZATION"
} 
#------------------------------------BILLING: Credit card is about to expire----------------------------
# Resend the "Credit card is about to expire" alerts after specified interval minutes 
variable "billing_creditCard_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Credit card is about to expire" alerts if condition lasts specified minutes 
variable "billing_creditCard_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

#Threshold value for Billing "Credit card is about to expire"
variable "threshold_creditCard"{
  default = 100
}

#event type defined for "Credit card is about to expire" alerts
variable "billing_creditCard_eventType" {
  default = "CREDIT_CARD_ABOUT_TO_EXPIRE"
}

#------------------------------------ENCRYPTION_KEY: GCP Encryption key elapsed----------------------------
# Resend the "GCP encryption key elapsed time" alerts after specified interval minutes 
variable "encryption_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "GCP encryption key elapsed time" alerts if condition lasts specified minutes 
variable "encryption_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# Threshold value for "GCP encryption key elapsed time" alerts
variable "threshold_encryption"{
  default = 3
}

#event type defined for "GCP encryption key elapsed time" alerts
variable "encryption_eventType" {
  default = "GCP_ENCRYPTION_KEY_NEEDS_ROTATION"
}

#------------------------------------ENCRYPTION_KEY: AWS encryption key elapsed time since last rotation is ----------------------------
# Resend the "AWS encryption key elapsed time since last rotation is " alerts after specified interval minutes 
variable "encryptionAWS_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "AWS encryption key elapsed time since last rotation is " alerts if condition lasts specified minutes 
variable "encryptionAWS_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# Threshold value for "AWS encryption key elapsed time since last rotation is " alerts
variable "threshold_encryptionAWS"{
  default = 3
}

#event type defined for "AWS encryption key elapsed time since last rotation is " alerts
variable "encryptionAWS_eventType" {
  default = "AWS_ENCRYPTION_KEY_NEEDS_ROTATION"
}


#------------------------------------ENCRYPTION_KEY: Azure encryption key elapsed time since last rotation is  ----------------------------
# Resend the "Azure encryption key elapsed time since last rotation is  " alerts after specified interval minutes 
variable "encryptionAzure_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "Azure encryption key elapsed time since last rotation is " alerts if condition lasts specified minutes 
variable "encryptionAzure_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# Threshold value for "Azure encryption key elapsed time since last rotation is " alerts
variable "threshold_encryptionAzure"{
  default = 3
}

#event type defined for "AWS encryption key elapsed time since last rotation is " alerts
variable "encryptionAzure_eventType" {
  default = "AWS_ENCRYPTION_KEY_NEEDS_ROTATION"
}



#------------------------------------X.509 User Authentication: Client Certificates Expiration----------------------------
# Resend the "X.509 User Authentication, Client Certificates Expiration" alerts after specified interval minutes 
variable "user_auth_client_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "X.509 User Authentication, Client Certificates Expiration" alerts if condition lasts specified minutes 
variable "user_auth_client_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# Threshold value for "X.509 User Authentication, Client Certificates Expiration" alerts
variable "threshold_user_auth_client"{
  default = 3
}

#event type defined for "X.509 User Authentication, Client Certificates Expiration" alerts
variable "user_auth_client_eventType" {
  default = "NDS_X509_USER_AUTHENTICATION_MANAGED_USER_CERTS_EXPIRATION_CHECK"
}

#------------------------------------X.509 User Authentication: CA Expiration----------------------------
# Resend the "X.509 User Authentication, CA Expiration" alerts after specified interval minutes 
variable "user_auth_CA_interval_min"{
  description = "Specifies interval time in between alert notification"
  default = 30
}

# Send the "X.509 User Authentication, CA Expiration" alerts if condition lasts specified minutes 
variable "user_auth_CA_delay_min"{
  description = "Send notification if condition lasts at least the amount of minutes specified"
  default = 15
}

# Threshold value for "X.509 User Authentication, Client Certificates Expiration" alerts
variable "threshold_auth_CA_client"{
  default = 3
}

#event type defined for "X.509 User Authentication, Client Certificates Expiration" alerts
variable "user_auth_CA_eventType" {
  default = "NDS_X509_USER_AUTHENTICATION_CUSTOMER_CA_EXPIRATION_CHECK"
}