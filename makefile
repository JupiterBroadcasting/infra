tfinit:
	cd terraform/demo; terraform init
	cd terraform/dev; terraform init
	cd terraform/dns-ssh; terraform init

# core
core:
	cd ansible; ansible-playbook -b run.yaml --limit core --ask-become-pass

corecomp:
	cd ansible; ansible-playbook run.yaml --limit core --tags compose

status:
	cd ansible; ansible-playbook -b run.yaml --limit status --ask-become-pass

statuscomp:
	cd ansible; ansible-playbook run.yaml --limit status --tags compose

dev:
	cd ansible; ansible-playbook -b run.yaml --limit dev --ask-become-pass

devcomp:
	cd ansible; ansible-playbook run.yaml --limit dev --tags compose

# ansible housekeeping

reqs:
	cd ansible; ansible-galaxy install -r requirements.yaml

forcereqs:
	cd ansible; ansible-galaxy install -r requirements.yaml --force

decrypt:
	cd ansible; ansible-vault decrypt vars/vault.yaml

encrypt:
	cd ansible; ansible-vault encrypt vars/vault.yaml
