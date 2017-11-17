# gitBaseBlobs
Use sed to replace my name in the license file with yours.

Linux: `sed -i 's/Roy Myers/First Last/g' LICENSE`

Mac: `sed -i .bak 's/Roy Myers/First Last/g' LICENSE && rm LICENSE.bak`
