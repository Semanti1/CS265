USER = FillIn
.PHONY : run

#	-@echo "Getting the one from the Web..." ;\
#		d=`mktemp -d tmp.XXXXXX` ; \
#		cd "$$d" ; \
#		wget 

run :
	-@echo "Checking files: $(FILES)"
	-@if [ -r info.cgi ] ; then \
			echo "Looking at the file you submitted" ; \
			cat info.cgi ; \
		else \
			echo "can't find info.cgi" ; \
		fi
	-@echo "Done!"

