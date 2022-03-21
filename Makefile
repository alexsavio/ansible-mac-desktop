version := $(shell python -c 'import version; print(version.__version__)')

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
	pre-commit install

deps/install-ci:: deps/pre
	poetry install

deps/install-ci:: deps/post

clean: clean-ansible

clean-ansible:
	rm -fr playbook.retry
	rm -fr .ansible_cache/

version:
	@echo v$(version)

tag:
	@echo "Create git tag v$(version), if not present"
	git rev-parse --verify v$(version) || (git tag v$(version) && git push --tags)

release::
	semantic-release version

release::
	poetry version v$(version)

release::
	semantic-release publish
