[maexware] Admin Dashboard
===============
Show information dashboard on admin index


### Manual installation / configuration

Download the SourceCode from Github as zip and extract the module to /source/modules/mx/admindashboard

Open composer.json and find "autoload" -> "prs-4" and add line

    "autoload": {
        "psr-4": {
            "maexware\\AdminDashboard\\": "./source/modules/mx/admindashboard"
        }
    }

after that perform an 

`composer dump-autoload`

### Composer installation / configuration

In order to install the module via composer run the following commands in commandline in your shop base directory (where the shop's composer.json file is located).


`composer config repositories.maexware/admindashboard vcs https://github.com/maexware/admindashboard `

`composer require maexware/admindashboard:dev-master`


