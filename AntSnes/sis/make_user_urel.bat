call del AntSnes_urel.sis
call del AntSnes_signed.sis
call del AntSnes_signed_en.sis
call makesis AntSnes_urel.pkg 
call makesis AntSnes_urel_en.pkg 
signsis AntSnes_urel.sis AntSnes_signed.sis AntSnes.cer AntSnes.key
signsis AntSnes_urel_en.sis AntSnes_signed_en.sis AntSnes.cer AntSnes.key
call del AntSnes_urel.sis
call del AntSnes_urel_en.sis