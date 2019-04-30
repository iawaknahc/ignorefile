It takes a single FILE as argument.

  $ ./ignorefile.exe
  ignorefile: required argument FILE is missing
  Usage: ignorefile [OPTION]... FILE
  Try `ignorefile --help' for more information.
--> exit 1

It passes good file.

  $ ./ignorefile.exe good.ignore

It fails bad file.

  $ ./ignorefile.exe bad.ignore
  - [E:E003] Missing ignore pattern `*.cer'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.cert'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.gpg'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.key'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.p12'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.p8'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.pem'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `*.pfx'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `.env'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `.env.*'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `.git'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `.svn'
             File  : bad.ignore
  - [E:E003] Missing ignore pattern `docker-compose.override.yml'
             File  : bad.ignore
--> exit 1
