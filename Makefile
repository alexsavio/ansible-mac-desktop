deps/pre::
	python -m pip install -U pip setuptools poetry

deps/post::
	ansible-galaxy collection install -r requirements.yml

deps/install:: deps/pre
	poetry install --no-dev

deps/install:: deps/post

deps/install-dev:: deps/pre
	poetry install

deps/install-dev:: deps/post

deps/install-dev::
	poetry run pre-commit install

deps/install-ci:: deps/pre
	poetry install

deps/install-ci:: deps/post

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

playbook::
	ansible-playbook playbook.yml -K

playbook/local::
	ansible-playbook playbook.yml -c local -K
