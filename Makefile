package=$(head -n1 debian/changelog | awk '{print $1}')
repoversion=$(shell LANG=C aptitude show php-flexibee | grep Version: | awk '{print $$2}')
nextversion=$(shell echo $(repoversion) | perl -ne 'chomp; print join(".", splice(@{[split/\./,$$_]}, 0, -1), map {++$$_} pop @{[split/\./,$$_]}), "\n";')

all: fresh build install

fresh:
	echo fresh

install: 
	echo install
	
build:
	echo build

clean:
	rm -rf debian/daily 
	rm -rf debian/*.substvars debian/*.log debian/*.debhelper debian/files debian/debhelper-build-stamp



deb:
	dpkg-buildpackage -A -us -uc

release:
	echo Release v$(nextversion)
	dch -v $(nextversion) `git log -1 --pretty=%B | head -n 1`
	debuild -i -us -uc -b
	git commit -a -m "Release v$(nextversion)"
	git tag -a $(nextversion) -m "version $(nextversion)"



.PHONY : install
	
