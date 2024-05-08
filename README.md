# pdf-compress

Compress all the pdf in a folder with a bash script

---

## Istructions

This script is writing in bash but you can use WSL for running the code with Windows.

1. Install [ghostscript](https://www.ghostscript.com/) for ubuntu use

```
sudo apt update
sudo apt install ghostscript
```

2. Create a folder and insert into that your folder with all your pdf (name a for example) and this script.
3. Use cd for changing directory and set your main directory.

```
cd a
```

4. Check if the name of the folder is the same that you set in the script.
5. Set the permission of the file and the folder

```
chmod -R u=rwx a
```

6. Run the script with

```
./pdf_compess.sh
```

7. Read the output for the confirm.

gg!
