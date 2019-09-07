gke: 
	kustomize build manifests/overlays/gke | kubectl apply -f -

delete-gke: 
	kustomize build manifests/overlays/gke | kubectl delete -f -