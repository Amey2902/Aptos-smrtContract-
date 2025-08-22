module MyModule::HealthDataBackup1 {
    use aptos_framework::signer;
    use std::string::{Self, String};
    use aptos_framework::timestamp;

    /// Struct representing a health data backup record.
    struct HealthRecord has store, key {
        data_hash: String,        // Hash of the encrypted health data
        backup_count: u64,        // Number of backups created
        last_updated: u64,        // Timestamp of last backup
        is_active: bool,          // Status of the health record
    }

    /// Function to create a new health data backup record.
    public fun create_health_record(patient: &signer, data_hash: String) {
        let current_time = timestamp::now_seconds();
        let health_record = HealthRecord {
            data_hash,
            backup_count: 1,
            last_updated: current_time,
            is_active: true,
        };
        move_to(patient, health_record);
    }

    /// Function to update existing health data backup.
    public fun update_health_backup(
        patient: &signer, 
        new_data_hash: String
    ) acquires HealthRecord {
        let patient_addr = signer::address_of(patient);
        let health_record = borrow_global_mut<HealthRecord>(patient_addr);
        
        // Update the health record with new backup data
        health_record.data_hash = new_data_hash;
        health_record.backup_count = health_record.backup_count + 1;
        health_record.last_updated = timestamp::now_seconds();
    }

    /// Public view function to check if a health record exists.
    #[view]
    public fun has_health_record(patient_addr: address): bool {
        exists<HealthRecord>(patient_addr)
    }

    /// Public view function to get backup count.
    #[view]
    public fun get_backup_count(patient_addr: address): u64 acquires HealthRecord {
        let health_record = borrow_global<HealthRecord>(patient_addr);
        health_record.backup_count
    }
}