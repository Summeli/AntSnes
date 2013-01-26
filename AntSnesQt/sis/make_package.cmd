#NOKIA signed
#call createsis create -cert nokia_certificate.cer -key NOKIA.key AntSnes_urel.pkg
#call createsis create -cert nokia_certificate.cer -key NOKIA.key  AntSnes_installer.pkg
# non-nokia signed
call createsis create -cert antsnesqt.cer -key antsnesqt.key AntSnes_urel.pkg
call createsis create -cert antsnesqt.cer -key antsnesqt.key  AntSnes_installer.pkg