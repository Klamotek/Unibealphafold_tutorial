### Unibealphafold_tutorial


## Instalation and 1st run

Campus Account must be activated for UBELIX

• If not yet, request activation 
```
https://serviceportal.unibe.ch/hpc
```

1.	Download and install MobaXterm; choose Installer Edition
```
https://mobaxterm.mobatek.net/download.html
```
2.	Open MobaXterm to login to Ubelix 
```
a.	ssh campus_account@submit.unibe.ch

b.	password is the same as for your university account

c.  pass your password again in a pop-up window 

```

3.	Copy and paste those lines (!!! here you copy with a right click !!!):

```

mkdir main_colabfold

cd main_colabfold/

mkdir output

mkdir input

mkdir errors

wget https://raw.githubusercontent.com/YoshitakaMo/localcolabfold/main/install_colabbatch_linux.sh

bash install_colabbatch_linux.sh

```

4.	Download the job template (https://github.com/Klamotek/Unibecolabfold_tutorial)

5.	Paste it into your main_colabfold folder

6.  Paste protein sequence in input folder (protein's sequence has to be in fasta file, for multimer prediction separate sequences with ':')

7.	Copy and paste

```
nano colabfold_temp.sh
```

8.	Fill up all placeholders in the file 

!!! IMPORTANT !!! USE _ as space, otherwise it could not work

9.	To close and save the file, use Ctrl + O and Ctrl + X

10.	If you change the name of the file, use later your named file

11.	To run prediction type:

```
sbatch colabfold_temp.sh
```
## Next run 

1. Go to the ColabFold folder
```
cd main_colabfold/
```
2. Edit your job template

Adjust TIME, MEM-PER-CPU, GRES and INPUT according to the instructions in the template

The input file has to end with .fasta otherwise the job will be not submitted 

3. Run prediction (!!! If you changed the name of your job file remember to use your changed job file name !!!)
```
sbatch colabfold_temp.sh
```
