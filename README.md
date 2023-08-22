# eLife Kubernetes cluster configurations

This repo defines the cluster configurations in use at eLife. Everything from the EKS cluster configs (driven by [eksctl](https://eksctl.io/)) to flux manifests that are automatically applied from the master branch in this repo.

Each cluster has:
- A EKS config defined in `./eks-configs/{clustername}.yaml`
- A fluxv2 base kustomization defined in `./clusters/{clustername}`
- Each of those base kustomizations pulls in further kustomizations, primarily:
  - crds (`./crds`) contain the CRDs used by the clusters
  - infrastructure (`./infrastructure`) contain services that either serve the cluster (such as monitoring) or provide further services for applications.
  - applications (`./applications`) contain the applications
  - each of these contain a `./base` directory that has the bulk of the definitions and `./clusters/{clustername}` that is the overlay for each cluster.
  - Each of these also use the [variable substitution](https://fluxcd.io/flux/components/kustomize/kustomization/#post-build-variable-substitution) feature of flux kustomization to allow cluster-specific hostnames for services that are cluster specific.

## Tools

- eksctl
- flux
- kubectl

or use asdf to install specific tools in .tool-versions

## Dashboards


## Adding/Editing Deployments

### Debugging

## Services available on the Cluster

## Administration
