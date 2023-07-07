# Unibealphafold_tutorial

1.	Download MobaXterm (https://mobaxterm.mobatek.net/download.html)

2.	Login to Ubelix 

a.	ssh your_unibe_login@submit.unibe.ch

b.	password is the same as for your university account 

3.	Copy and paste those lines:

mkdir main_colabfold

cd main_colabfold/

mkdir output

mkdir input

mkdir errors

wget https://raw.githubusercontent.com/YoshitakaMo/localcolabfold/main/install_colabbatch_linux.sh

bash install_colabbatch_linux.sh

4.	Download job template (https://github.com/Klamotek/Unibecolabfold_tutorial)

5.	Paste it in your main_colabfold folder

6.  Paste protein sequence in input folder (protein's sequence has to be in fasta file, for multimer prediction separate sequences with ':')

7.	Copy and paste

nano colabfold_temp.sh

8.	Fill up all placeholders in the file 

9.	To close and save the file use Ctrl + O and Ctrl + X

10.	If you change the name of the file use later your named file

11.	To run prediction type:

sbatch colabfold_temp.sh
