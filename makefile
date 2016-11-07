env_dir = env
activate_script = activate
activate = . $(env_dir)/bin/$(activate_script)
pip = $(activate) && pip
req_file = requirements.txt
jupyter = $(activate) && jupyter

.PHONY: run
run: | install
	$(jupyter) notebook

$(env_dir):
	python3 -m venv $@

install: | $(env_dir)
	$(pip) install -r $(req_file) && \
	touch $@

.PHONY: clean
clean:
	rm -rf $(env_dir) install
