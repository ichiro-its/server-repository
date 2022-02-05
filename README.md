# server-repository

## Run script

Run the `script.bash`.
```
bash script.bash
```
Then we must fill several input:
1. What kind of key (select first option for RSA and RSA)
2. How length are the RSA keys bits (type 4096) 
3. How long is the valid date (select first option for no expiration date)
4. Real Name (fill with ICHIRO ITS)
5. Email Address (fill with ichiro.its@gmail.com)
6. Comment (optional - whatever)
7. Passphrase (password for the gpg key - skip with clicking Ok and Confirmation without passphrase twice)

Finally, the repository folder will be created in the home directory. Include any debian package first, before using the debian repository.
