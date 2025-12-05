RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
RESET='\e[0m'


# getting project name 
name_project=$1

while [[ -z $name_project ]] do 
{
    read -e -p   "enter the name of your project : " name_project
}
done

# getting project path
path_project=$2
while [[  -z $path_project || ! -e $path_project  ]] ; do 
{
    read -e -p "were do you want your project : " path_project
    if [[ -z $path_project || ! -e $path_project ]]; then
        echo "ERROR : enter a valid path!!"
    else
        break
    fi
}
done

mkdir -p $path_project/$name_project/
cd      $path_project/$name_project/

# asking to include an exercice subdirectory or not 
option_exercice=$3
while [[ -z $option_exercice ]] ; do
{
    read -p "do you want to creat a subdirectory inside your project?
yes or no : " option_exercice
    
}
done

if [[ $option_exercice == yes || $option_exercice == y || $option_exercice == YES   ]]; then 

    while [[ -z $name_exercice ]] do
        read -e -p "enter the name of your subdirectory directory : " name_exercice
    done

    mkdir   $name_exercice
    cd      $name_exercice
fi

#creating deafault structure
mkdir -p public/{pages,images,vedios,css}

echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./public/css/app.css">
</head>
<body>
    
</body>
</html>" > index.html
    ls

echo "*{
    margin: 0px;
    padding: 0px;
}" > public/css/app.css


# asking to include sass paths

option_sass=$4
while [[ -z $option_sass ]] ; do
{
    read -p "do you want to creat a sass directory ?
yes or no : " option_sass

}
done

# if option_sass  is true 
if [[ $option_sass == yes || $option_sass == y || $option_sass == YES   ]]; then

    mkdir -p    src/sass/modules/{about,home}

    option_sassscss=

    while [[ -z $option_sassscss ]] ; do
    {

        read -p "sass or scss : " option_sassscss
        
    }
    done

    if [[ $option_sassscss == sass || $option_sassscss == SACC ]]; then

    touch   src/sass/{app.sass,_allModules.sass,_variables.sass,modules/home/{_footer.sass,_header.sass,_main.sass}}
    echo -e "${GREEN}sass structur added${RESET}"

    #*import bootstrap is commanted by default

    #import variables modules bootstrap to app.sass
    echo "@import ./_variables
//@import ../../node_modules/bootstrap/scss/bootstrap
@import ./_allModules" > src/sass/app.sass

    #import functions and variables from bootstrap 
echo "//@import ../../node_modules/bootstrap/scss/functions
//@import ../../node_modules/bootstrap/scss/variables" > src/sass/_variables.sass

    #import home items to allmodules
    echo "@import ./modules/home/_header
@import ./modules/home/_main
@import ./modules/home/_footer" > src/sass/_allModules.sass


    elif [[ $option_sassscss == scss || $option_sassscss == SCSS ]]; then

    touch   src/sass/{app.scss,_allModules.scss,_variables.scss,modules/home/{_footer.scss,_header.scss,_main.scss}}
    echo -e "${GREEN}scss structur added${RESET}"

    #*import bootstrap is commanted by default

    #import variables modules bootstrap to app.scss
    echo "@import "./_variables";
//@import "../../node_modules/bootstrap/scss/bootstrap";
@import "./_allModules";
" > src/sass/app.scss

    #import functions and variables from bootstrap 
echo "//@import "../../node_modules/bootstrap/scss/functions";
// @import "../../node_modules/bootstrap/scss/variables";" > src/sass/_variables.scss

    #import home items to allmodules
    echo "@import "./modules/home/_header";
@import "./modules/home/_main";
@import "./modules/home/_footer";
" > src/sass/_allModules.scss

    fi

fi

# asking to include bootstrap

option_bootstrap=$5
while [[ -z $option_bootstrap ]] ; do
{
    read -p "do you want to include bootstrap ?
yes or no : " option_bootstrap
    
}
done

# if option_bootstrap  is true 
if [[ $option_bootstrap == yes || $option_bootstrap == y || $option_bootstrap == YES   ]]; then 
    npm init -y 
    npm i bootstrap
    echo -e "${GREEN}bootstrap added${RESET}"
fi

# open vscode if option_code is true 
echo -e "${GREEN}done${RESET}"
    echo "I assume you have VScode"
    echo "do you want to open this project in vscode ?"
    echo "yes or no"

    option_code=

    read option_code

    if [[ $option_code == yes || $option_code == y || $option_code == YES   ]]; then 
        ls
        code .
    fi