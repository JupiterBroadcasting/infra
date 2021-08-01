tfinit:
	cd terraform/demo; terraform init
	cd terraform/dev; terraform init
	cd terraform/dns-ssh; terraform init

dns:
	cd terraform/dns-ssh; terraform apply

# demo
democreate:
	cd terraform/demo; terraform apply

demonuke:
	cd terraform/demo; terraform destroy

democonfigure:
	cd ansible; ansible-playbook -b run.yaml --limit demo --ask-become-pass

demorepl:
	cd ansible; ansible-playbook -b run.yaml --limit demo --tags replication

democomp:
	cd ansible; ansible-playbook run.yaml --limit demo --tags compose

# ansible housekeeping

reqs:
	cd ansible; ansible-galaxy install -r requirements.yaml

forcereqs:
	cd ansible; ansible-galaxy install -r requirements.yaml --force

decrypt:
	cd ansible; ansible-vault decrypt vars/vault.yaml

encrypt:
	cd ansible; ansible-vault encrypt vars/vault.yaml
