set-github-token:
	@kubectl -n argocd create secret generic wevans-github-token \
	  --from-literal=TOKEN=$$GITHUB_TOKEN \
	  --dry-run=client -o yaml | \
	kubeseal --controller-name=sealed-secrets -oyaml - \
	  > manifests/wevans/templates/github_token.yaml
