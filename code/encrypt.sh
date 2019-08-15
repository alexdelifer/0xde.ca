#!/bin/sh -ex
#
# Create a shell script with an embeded blob of encrypted data, the script will
# ask for a password then decrypt and dump the blob to stdout when executed.
# EXAMPLE:
#
# $ ./encrypt.sh "secretstuff" "safestuff.sh"
#
# To retrieve your data, run the following.
# EXAMPLE:
#
# $ ./safestuff.sh > secretstuff
#


INPUT="$1"
OUTPUT="$2"

CYPHER="$(openssl enc \
        -aes-256-cbc \
        -salt \
        -pbkdf2 \
        -in "$INPUT" \
        -a           \
        -out - )"

# Write payload + decryptor
echo "#!/bin/sh" > "$OUTPUT"
echo "DATA=\"$CYPHER\"" >> "$OUTPUT"
echo "openssl enc \\
        -aes-256-cbc \\
        -salt \\
        -pbkdf2 \\
        -d \\
        -a \\
        -in - <<< \"\$DATA\"" >> "$OUTPUT"

chmod +x "$2"
