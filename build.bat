
@echo "============================begin  getVersion....============================"
@set PWD=%cd%
@cd ..\..\
perl getVersion.pl
@cd %PWD%
@echo "============================create getVersion done!============================"


