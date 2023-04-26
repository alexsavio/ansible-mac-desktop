# install ansible galaxy dependencies
deps-post:
	ansible-galaxy collection install -r requirements.yml

deps-install:
	poetry install --no-dev
	just deps-post

deps-install-ci:
	poetry install
	just deps-post

deps-install-dev: deps-install-ci
	poetry install
	just deps-post
	pre-commit install

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache

ansible-playbook:
	ansible-playbook playbook-yml
