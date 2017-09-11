# Payoh Presta Webkul
---
## This module is compatible with Webkul Marketplace 2.0.2
## How to use this repository

### Get and change sources
If you want to do any changes follow this steps:

1.  Clone the repo
 ```
 $ git clone https://github.com/payoh/prestashop-webkul-payoh-plugin.git
 ```
 
2.  Checkout into `develop` branch
 ```
 $ git checkout -b develop origin/develop
 ```
 
3.  Write your modifications and save your files
4. Stage and commit your changes
 ```
 // Stage all modifications
 $ git add .
 
 // Commit with message. For good practices see: https://github.com/ajoslin/conventional-changelog/blob/master/conventions/angular.md
 $ git commit -m "fix(webkit): Not display card form selection if customer no have crad number"
 ```
5.  Share your code
 ```
 $ git push
 ```
 
6. Finally, send pull request

### Build Prestashop package

You can easily build Prestashop package with composer.  
If you don't have composer see: https://getcomposer.org/.  
The following example take in consideration you have command `composer` available in your PATH environment.  
Instead you can use `composer.phar` directly but it is less convenient.  
`zip` command is also required.

**IMPORTANT**: For now, make sure you are in master branch (`$ git checkout master`)

1.  Install dependencies
 In project's root run:
 ```
 $ composer install
 ```
 
2.  Build package
 ```
 $ composer package
 ```
 
 If build package is successful you can see *zip file* in `dist/`.

## Wiki
---
You can found some informations about installation,configuration and how to use this module in [Wiki](https://github.com/payoh/prestashop-webkul-payoh-plugin/wiki).

## Demo website
---
#### Frontend
http://lw.presta.sirateck.com/
#### Backend
http://lw.presta.sirateck.com/admin3624wol4n  
kassim@sirateck.com / aqwzsx123


## LICENCE (TMP ??)
---
```
Copyright 2015 Payoh

This source file is subject to the MIT License
that is bundled with this package in the file LICENSE.txt.
It is also available through the world-wide-web at this URL:
http://opensource.org/licenses/mit-license.php
```
