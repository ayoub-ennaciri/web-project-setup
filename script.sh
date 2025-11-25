RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
RESET='\e[0m'



# getting project name 
name_project=$1

while [[ -z $name_project ]] do 
{
    read -e -p   "eneter the name of your project : " name_project
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


# asking to include an exercice subdirectory or not 
option_exercice=$3
while [[ -z $option_exercice ]] ; do
{
    read -p "do you want to creat a subdirectory inside your project?
yes or no : " option_exercice
    
}
done


# asking to include sass paths

option_sass=$4
while [[ -z $option_sass ]] ; do
{
    read -p "do you want to creat a sass directory ?
yes or no : " option_sass
    
}
done


# getting the name of the exercice directory
name_exercice=$4
if [[ $option_exercice == yes || $option_exercice == y || $option_exercice == YES   ]]; then 

    while [[ -z $name_exercice ]] do
        read -e -p "enter the name of your subdirectory directory : " name_exercice
    done

    mkdir -p $path_project/$name_project/$name_exercice/public/{pages,images,vedios,css}
    echo -e "created project ${YELLOW}$name_project${RESET} in ${YELLOW}$path_project${RESET}"
    echo -e "created subdirectory $name_exercice $name_project"
    # if option_sass  is true 
    if [[ $option_sass == yes || $option_sass == y || $option_sass == YES   ]]; then 
        mkdir -p    $path_project/$name_project/$name_exercice/src/sass/modules/{about,home/sections}
    fi

    echo "generating files"
    cd $path_project/$name_project/$name_exercice/
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
    cd public/css/
    echo "*{
    margin: 0px;
    padding: 0px;
}" > app.css
    echo -e "${GREEN}done${RESET}"
    echo "I assume you have VScode"
    echo "do you want to open this project in vscode ?"
    echo "yes or no"

    option_code=

    read option_code

    if [[ $option_code == yes || $option_code == y || $option_code == YES   ]]; then 
        ls
        code ../../
    fi
else 
    mkdir -p $path_project/$name_project/public/{pages,images,vedios,css}
    echo -e "created project ${YELLOW}$name_project${RESET} , in ${YELLOW}$path_project${RESET}"
    # if option_sass  is true 
    if [[ $option_sass == yes || $option_sass == y || $option_sass == YES   ]]; then 
        mkdir -p    $path_project/$name_project/$name_exercice/src/sass/modules/{about,home/sections}
    fi
    echo "generating files"
    cd $path_project/$name_project/
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

    cd public/css/
    echo "*{
    margin: 0px;
    padding: 0px;
}" > app.css
    echo -e "${GREEN}done${RESET}"
    echo "I assume you have VScode"
    echo "do you want to open this project in vscode ?"
    echo "yes or no"

    option_code=

    read option_code

    if [[ $option_code == yes || $option_code == y || $option_code == YES   ]]; then 
        ls
        code ../../
    fi
fi

