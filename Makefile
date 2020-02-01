
repo: build/index.yaml

REPOURL := https://charts.repo.hexf.me/

CHARTS := $(wildcard */)
CHARTS := $(filter-out build/, $(CHARTS))
CHARTS := $(filter-out $(wildcard _*/), $(CHARTS))

CHARTSTGZ := $(addprefix build/,$(addsuffix .tgz,$(CHARTS)))

build/dependencies: build/ 
	python3 -m pip install ruamel.yaml
	touch $@


$(CHARTSTGZ): $(CHARTS)
	echo $<
	python3 $<build.py
	helm lint $<
	helm dependencies update $<
	helm package $< -d build/


build/: 
	mkdir -p build

build/index.yaml: build/dependencies $(CHARTSTGZ) 
	wget $(REPOURL)index.yaml -O build/index.yaml
	helm repo index build/ --url $(REPOURL)


clean:
	rm -rf build/