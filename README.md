# HealthDataBackup1 Smart Contract

A secure, decentralized health data backup system built on the Aptos blockchain using Move language.

## Overview

The HealthDataBackup1 smart contract enables patients to securely backup their health data on the blockchain while maintaining complete privacy and control. The contract stores only encrypted hashes of health data, never the raw sensitive information.

## Features

- ✅ **Privacy-First**: Only encrypted data hashes are stored on-chain
- ✅ **Patient-Controlled**: Only patients can create and update their own records
- ✅ **Backup Tracking**: Automatic counting and timestamping of backups
- ✅ **Decentralized**: No central authority controls your health data
- ✅ **Immutable Audit Trail**: Transparent backup history on blockchain

## Contract Details

### Module Information
- **Module Name**: `MyModule::HealthDataBackup1`
- **Contract Address**: ``
- **Network**: Mainnet/Testnet/Devnet
- **Version**: 1.0.0

### Deployment Information
- **Deployer Address**: `0xYOUR_WALLET_ADDRESS_HERE`
- **Deployment Date**: [Insert deployment date]
- **Transaction Hash**: `0xfc65c2b41424ba75a773f9bc65fd9442a6d3f5ef72702421d784ff8101c986ad`

## Contract Structure

### HealthRecord Struct
```move
struct HealthRecord has store, key {
    data_hash: String,        // Hash of encrypted health data
    backup_count: u64,        // Number of backups created
    last_updated: u64,        // Timestamp of last backup
    is_active: bool,          // Status of the health record
}
```

## Functions

### 1. `create_health_record(patient: &signer, data_hash: String)`
Creates a new health data backup record for a patient.

**Parameters:**
- `patient`: The patient's signer account
- `data_hash`: Encrypted hash of the health data

### 2. `update_health_backup(patient: &signer, new_data_hash: String)`
Updates an existing health data backup with new information.

**Parameters:**
- `patient`: The patient's signer account
- `new_data_hash`: New encrypted hash of updated health data

### View Functions
- `has_health_record(patient_addr: address): bool` - Check if record exists
- `get_backup_count(patient_addr: address): u64` - Get total backup count

## Usage Example

```move
// Create initial health record
HealthDataBackup1::create_health_record(&patient_signer, string::utf8(b"encrypted_hash_123"));

// Update with new health data
HealthDataBackup1::update_health_backup(&patient_signer, string::utf8(b"new_encrypted_hash_456"));

// Check if record exists (replace with actual addresses)
let exists = HealthDataBackup1::has_health_record(@0xYOUR_PATIENT_ADDRESS_HERE);

// Get backup count (replace with actual addresses)
let count = HealthDataBackup1::get_backup_count(@0xYOUR_PATIENT_ADDRESS_HERE);
```

## Security & Privacy

🔒 **Data Privacy**: Raw health data is never stored on-chain. Only encrypted hashes are used.

🔒 **Access Control**: Only the patient (account owner) can modify their health records.

🔒 **Immutable History**: All backup events are permanently recorded with timestamps.

## Configuration

### Move.toml Setup
Create a `Move.toml` file in your project root:
```toml
[package]
name = "HealthDataBackup1"
version = "1.0.0"
authors = ["Your Name <your.email@example.com>"]

[addresses]
MyModule = "0xYOUR_WALLET_ADDRESS_HERE"  # Replace with your wallet address

[dev-addresses]

[dependencies.AptosFramework]
git = "https://github.com/aptos-labs/aptos-core.git"
rev = "mainnet"
subdir = "aptos-move/framework/aptos-framework"

[dev-dependencies]
```

### Contract File Structure
```
your-project/
├── Move.toml                           # Contract configuration
├── sources/
│   └── HealthDataBackup1.move         # Your smart contract code
├── README.md                          # This documentation
└── scripts/                           # Deployment scripts (optional)
```

### Environment Variables (Optional)
Create a `.env` file for easier management:
```bash
CONTRACT_ADDRESS=0xYOUR_DEPLOYED_CONTRACT_ADDRESS_HERE
WALLET_ADDRESS=0xYOUR_WALLET_ADDRESS_HERE
NETWORK=testnet  # or mainnet/devnet
```

## Deployment
   - Aptos CLI installed
   - Move compiler setup
   - Funded Aptos account

2. **Deploy Contract:**
   ```bash
   aptos move publish --package-dir . --named-addresses MyModule=0xYOUR_TRANSACTION_ADDRESS_HERE
   ```

3. **Initialize:**
   ```bash
   aptos move run --function-id 0xYOUR_TRANSACTION_ADDRESS_HERE::HealthDataBackup1::create_health_record \
   --args string:"your_encrypted_data_hash"
   ```

4. **Query Functions:**
   ```bash
   # Check if record exists
   aptos move view --function-id 0xYOUR_TRANSACTION_ADDRESS_HERE::HealthDataBackup1::has_health_record \
   --args address:0xPATIENT_ADDRESS_HERE
   
   # Get backup count
   aptos move view --function-id 0xYOUR_TRANSACTION_ADDRESS_HERE::HealthDataBackup1::get_backup_count \
   --args address:0xPATIENT_ADDRESS_HERE
   ```

## Integration

This contract can be integrated with:
- Healthcare applications
- Personal health record (PHR) systems  
- Medical data management platforms
- Health insurance systems

## Development

### Prerequisites
- Aptos CLI v1.0+
- Move language support
- Git

### Setup
```bash
git clone <repository-url>
cd health-data-backup1
aptos move compile
```

### Testing
```bash
aptos move test
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

⚠️ **Important**: This smart contract is designed for educational and development purposes. For production use in healthcare environments, ensure compliance with relevant regulations (HIPAA, GDPR, etc.) and conduct thorough security audits.

## Support

- 📧 Issues: [GitHub Issues](../../issues)
- 💬 Discussions: [GitHub Discussions](../../discussions)
- 📖 Aptos Docs: [https://aptos.dev](https://aptos.dev)

---

**Built with ❤️ for secure healthcare data management on Aptos**
<img width="1920" height="1020" alt="image" src="https://github.com/user-attachments/assets/6aa2467d-f671-48ed-8d6b-268a4deed8a6" />

