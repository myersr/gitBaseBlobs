#!/bin/bash

#************************************************#
#                 baseblob.sh                    #
#             written by Roy Myers               #
#                Oct 01, 2018                    #
#                                                #
#          Generate prober .gitignore            #
#************************************************#

EX_CANTCREAT=73                   # No such directory.
E_BADARGS=85   # Wrong number of arguments passed to script.
outputfile=ignoreout.txt          # output .gitignore
templatePattern=*.gitignore #What to strip out from template file names
templateSuffix=.gitignore

# A useful one-liner which will give you the full directory name of the 
# script no matter where it is being called from.
#
# It will work as long as the last component of the path used to find the script
# is not a symlink (directory links are OK)
DIR=`pwd`

POSITIONAL=()
while [[ $# -gt 0 ]]
do
#echo "Triggered args and flags"
key="$1"

case $key in
    -o|--output)
    outputfile="$2"
    shift # past argument
    shift # past value
    ;;
    -a|--all)
    shopt -s nullglob
    ALL=true
    shift # past argument
    ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters


#No args input so we loop through all templates
if [[ $# -eq 0 || $ALL ]]
then
  echo "Triggered 0 length args"
  shopt -s nullglob
  allTemps=(*.gitignore)
else
  for template in $@
  do 
    allTemps+=(${template}$templateSuffix)
  done
fi

if [ -e "$outputfile" ]
then
  echo "Output file $filename already exists."
  exit $EX_CANTCREAT 
fi 

# --------------------------------------------------------- #
# cleanup_pfiles ()                                         #
# Removes all files in designated directory.                #
# Parameter: $target_directory                              #
# Returns: 0 on success, $E_BADDIR if something went wrong. #
# --------------------------------------------------------- #
generate_baseblob ()
{
  if [ -z "$1" ]
  then
    echo "Zero length in function"
    exit $E_BADARGS
  fi 
  
  for item in "$@"
  do
    echo "$(cat "$DIR"/$item >>`pwd`/"$outputfile")"
  done

  return 0   # Success.
}  

generate_baseblob ${allTemps[@]} 
echo $outputfile


exit $?
