RM=rm -f
SHELL=sh
VERSION=3.0
JUNKS=*.aux *.toc *.idx *.drv *.dvi *.log *.lof *.ist *.ilg *.ind *.out

all: test

#
#  You need to put the new geometry.sty in 
#  the current directory or a directory searched by LaTeX.
#
test:
	@echo
	@(for f in gtest*tex; do latex $$f; done)
	@echo
	@echo "--- Summary of Tests ---"
	@(grep -h Test gtest*.log)
	@echo "-------------------------"

clean:
	@$(RM) $(JUNKS) *~ \#*
	@echo 'Test directory has been cleaned up except geometry.{sty,cfg}.'

veryclean: clean
	@$(RM) geometry.sty geometry.cfg
	@echo Test directory has been cleaned up.
