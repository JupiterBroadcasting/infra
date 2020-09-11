tfinit:
	cd terraform/infra; terraform init

createdemo:
	cd terraform/infra; terraform apply

destroydemo:
	cd terraform/infra; terraform apply

configuredemo:
	cd ansible; ansible-playbook -b run.yaml --limit cartman --ask-become-pass --vault-password-file .vault-password

democompose:
	cd ansible; ansible-playbook -b run.yaml --limit cartman --ask-become-pass --vault-password-file .vault-password --tags compose




# ansible housekeeping

reqs:
	cd ansible; ansible-galaxy install -r requirements.yaml

forcereqs:
	cd ansible; ansible-galaxy install -r requirements.yaml --force

decrypt:
	cd ansible; ansible-vault decrypt --vault-password-file .vault-password vars/vault.yaml

encrypt:
	cd ansible; ansible-vault encrypt --vault-password-file .vault-password vars/vault.yaml
