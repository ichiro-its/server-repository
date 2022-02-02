# server-repository

## Run script

Run the `generate_key.bash` first:
```
bash generate_key.bash
```
Then we must fill several input:
1. What kind of key (select first option for RSA and RSA)
2. How length are the RSA keys bits (type 4096) 
3. How long is the valid date (select first option for no expiration date)
4. Real Name (fill with ICHIRO ITS)
5. Email Address (fill with ichiro.its@gmail.com)
6. Comment (optional - whatever)
7. Passphrase (password for the gpg key - skip)

After that, we will get output like this in terminal:
```
sec   rsa4096 2021-11-20 [SC]
      248D9D75677BFE82FA9FB1B86F38B9095A07C86B
uid           [ultimate] ICHIRO ITS <ichiro.its@gmail.com>
ssb   rsa4096 2021-11-20 [E]
      B2DA782BFCA05E40FB609005A5B85CF8DCAC1E12
```
The key-id will be used on next script (i.e `B2DA782BFCA05E40FB609005A5B85CF8DCAC1E12`)

The second script is `configure_reprepro.bash`.
Run the second script and put the key-id at the first argument.
```
bash configure_reprepro.bash <key-id>
```