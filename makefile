tfinit:
	cd terraform/demo; terraform init

democreate:
	cd terraform/demo; terraform apply

demonuke:
	cd terraform/demo; terraform destroy

democonfigure:
	cd ansible; ansible-playbook -b run.yaml --limit demo --ask-become-pass

democompose:
	cd ansible; ansible-playbook -b run.yaml --limit demo --tags compose




# ansible housekeeping

reqs:
	cd ansible; ansible-galaxy install -r requirements.yaml

forcereqs:
	cd ansible; ansible-galaxy install -r requirements.yaml --force

decrypt:
	cd ansible; ansible-vault decrypt --vault-password-file .vault-password vars/vault.yaml

encrypt:
	cd ansible; ansible-vault encrypt --vault-password-file .vault-password vars/vault.yaml
