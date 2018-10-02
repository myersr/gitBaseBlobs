# gitBaseBlobs

## Customize License 
Use sed to replace my name in the license file with yours.

Linux: `sed -i 's/Roy Myers/First Last/g' LICENSE`

Mac: `sed -i .bak 's/Roy Myers/First Last/g' LICENSE && rm LICENSE.bak`

## Generate .gitignore  

The included generate script will concatinate together multiple gitignore templates. The templates are just a gitignore file with only the pertinant lines.

**Usage: **  
```bash
generate-ignore.sh [-a] [-o outputfile] args...
```  
The args can consist of any template file name before the _.gitignore_. for example `generate-ignore.sh node` would include the node.gitignore template.
