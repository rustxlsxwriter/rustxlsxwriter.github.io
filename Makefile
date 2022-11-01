###############################################################################
#
# Makefile for rust_xlsxwriter documentation.
#
# Copyright 2022, John McNamara, jmcnamara@cpan.org
#

# Keep the output quiet by default.
Q=@
ifdef V
Q=
endif


# Copy the built html.
all:
	$(Q)mdbook build ../mdbook_rust_xlsxwriter
	$(Q)cp -r ../mdbook_rust_xlsxwriter/book/* .

update_images:
	$(Q)cp ../mdbook_rust_xlsxwriter/src/images/* images
	$(Q)git commit -m "updated images"
	$(Q)git push origin


release: all
	$(Q)git add .
	$(Q)git commit -m "updated docs"
	$(Q)git push origin
	$(Q)open https://rustxlsxwriter.github.io

