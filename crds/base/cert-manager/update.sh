#!/bin/bash

# Get current cert-manager chart

release_name=$(yq '.spec.releaseName' ../../../infrastructure/base/cert-manager/release.yaml)
chart_name=$(yq '.spec.chart.spec.chart' ../../../infrastructure/base/cert-manager/release.yaml)
chart_version=$(yq '.spec.chart.spec.version' ../../../infrastructure/base/cert-manager/release.yaml)
chart_repo=$(yq '.spec.url' ../../../infrastructure/base/cert-manager/source.yaml)
echo "$chart_repo" "$release_name" "$chart_name" "$chart_version"

helm template --repo "$chart_repo" "$release_name" "$chart_name" --version "$chart_version" --set installCRDs=true | yq 'select(.kind == "CustomResourceDefinition")' > ./cert-manager.crds.yaml
