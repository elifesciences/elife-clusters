# Bootstrap a cluster

## A new cluster

If this is a brand new cluster i.e. no current definitions.

- Create a new name for the cluster
- Create a directory in `clusters/` with the name of the cluster i.e. `clusters/{test-cluster}`
- Create a eksctl config in `clusters/{test-cluster}/eks-config.yaml`

## Bootstrap a cluster

- Generate a github token scoped to the `elife-clusters` repo with:
  - Administration: Read and write
  - Contents: Read and write
  - Metadata: Read-only
- Set `GITHUB_TOKEN` environment variable with the newly created token: `export GITHUB_TOKEN="${token}"`
- Run eksctl: `eksctl create cluster -f "clusters/{test-cluster}/eks-config.yaml"`

## Destroy a cluster

- Run `eksctl delete cluster -f "clusters/{test-cluster}/eks-config.yaml" --wait --disable-nodegroup-eviction`
- optionally run: `eksctl delete cluster -f "clusters/{test-cluster}/eks-config.yaml" --wait --disable-nodegroup-eviction` (or deal with failed evictions manually)
