VERSION!=awk '/version =/{print substr($$NF, 2,length($$NF)-2)}' pyproject.toml
BIKESHOP_DEPS!=find ./bikeshop -iname '*.xml' -o -iname '*.py' -o -iname '*.csv'
BIKESHOP_IMG=bikeshop/static/description/logo.png bikeshop/static/description/icon.png
ALL_DEPS=pyproject.toml

dist/odoo_bikeshop-$(VERSION)-py3-none-any.whl: $(BIKESHOP_DEPS) $(ALL_DEPS) $(BIKESHOP_IMG)
	poetry build -f wheel

dist/odoo_bikeshop-$(VERSION).tar.gz: $(BIKESHOP_DEPS) $(ALL_DEPS) $(BIKESHOP_IMG)
	poetry build -f sdist

bikeshop/static/description/icon.png: bikeshop/static/description/icon.svg
	inkscape --export-type="png" bikeshop/static/description/icon.svg

bikeshop/static/description/logo.png: bikeshop/static/description/logo.svg
	inkscape --export-type="png" bikeshop/static/description/logo.svg
