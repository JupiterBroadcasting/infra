tfinit:
	cd terraform/demo; terraform init
	cd terraform/dev; terraform init

# demo
democreate:
	cd terraform/demo; terraform apply

demonuke:
	cd terraform/demo; terraform destroy

democonfigure:
	cd ansible; ansible-playbook -b run.yaml --limit demo --ask-become-pass

democomp:
	cd ansible; ansible-playbook run.yaml --limit demo --tags compose

# dev
devcreate:
	cd terraform/dev; terraform apply

devnuke:
	cd terraform/dev; terraform destroy

devconfigure:
	cd ansible; ansible-playbook -b run.yaml --limit dev --ask-become-pass

devcomp:
	cd ansible; ansible-playbook run.yaml --limit dev --tags compose


# ansible housekeeping

reqs:
	cd ansible; ansible-galaxy install -r requirements.yaml

forcereqs:
	cd ansible; ansible-galaxy install -r requirements.yaml --force

decrypt:
	cd ansible; ansible-vault decrypt --vault-password-file .vault-password vars/vault.yaml

encrypt:
	cd ansible; ansible-vault encrypt --vault-password-file .vault-password vars/vault.yaml
