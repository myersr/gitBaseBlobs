# gitBaseBlobs

## Customize License 
Use sed to replace my name in the license file with yours.

Linux: `sed -i 's/Roy Myers/First Last/g' LICENSE`

Mac: `sed -i .bak 's/Roy Myers/First Last/g' LICENSE && rm LICENSE.bak`

## Generate .gitignore  

The included generate script will concatenate together multiple gitignore templates. The templates are just a gitignore file with only the pertinent lines.

**Usage:**  
```bash
generate-ignore.sh [-a] [-o outputfile] args...
```  
The args can consist of any template file name before the _.gitignore_. for example `generate-ignore.sh node` would include the node.gitignore template. 
`-a` or `--all` will include all templates and will over write including just one. ex. `generate-ignore.sh -a node dotnet` will create a gitignore with all templates and not just node & dotnet. It will not duplicate node & dotnet.  
To specify an output file use `-o filename` or `--output filename`. The file must not exist. You can then mv it to the correct directory and rename it .gitignore.
