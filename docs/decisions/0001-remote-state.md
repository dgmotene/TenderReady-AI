# 0001: Store Terraform state in S3
Status: accepted
Context: State is Terraform's record of what exists. A local file can be lost or cause conflicts.
Decision: Keep state in a versioned, private S3 bucket with lockfile locking.
Consequences: One bucket is created by hand (bootstrap script). Cost is a few cents a month.