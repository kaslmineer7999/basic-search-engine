# basic-search-engine

## how it works
its simply a HTML form that sends your query into a

bash CGI (not to be confused with Computer-generated imagery) script

that would search a text database contanied in `document root/db.txt` for the search term.
## demo
![demo video of "basic-search-engine"](https://github.com/user-attachments/assets/6d6ab6a0-908e-4ff3-a03e-f3e830f49544)
## sample database
a sample database should look like this:
```
example|http://example.com
google|http://google.com
youtube|http://youtube.com
facebook|http://facebook.com
tiktok|http://tiktok.com
pornhub|http://pornhub.com
```
## file structure
the file structure should look like this:
```
└── basic-search-engine
    ├── cgi-bin
    │   └── search.sh
    ├── db.txt
    └── index.html
```
## how to install
this guide will show the minimlist way to serve this basic search engine

1. install busybox by running
- on arch (and arch-based distrbutions such as manjaro):
  ```
  sudo pacman -S busybox
  ```
- on debian/ubuntu (or any debian/ubuntu-based distrbution)
  ```
  sudo apt install busybox -y
  ```
- on fedora/RHEL:
  ```
  sudo dnf install busybox
  ```
2. make sure that `busybox httpd` has the `-d` option by running
   ```
   busybox httpd --help|grep -i -- '-d'
   ```
   - if it outputs stuff about the `-d` option that means you're good
   - if it doesn't DO NOT CONTUINE
3. clone the repo by running:
   ```
   git clone https://github.com/kaslmineer7999/basic-search-engine ~/basic-search-engine
   ```
4. make sure everything in ~/basic-search-engine/cgi-bin is executable:
   ```
   chmod 755 ~/basic-search-engine/cgi-bin/*
   ```
5. start the server:
   ```
   echo "press ctrl+c to stop the server, and its avaliable at http://127.0.0.1:5555"
   busybox httpd -h ~/basic-search-engine -p 127.0.0.1:5555 -f -v
   ```
6. you're now done!      
