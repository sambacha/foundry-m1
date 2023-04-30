otool -L ~/.foundry/bin/forge | tail -n +2 | sed 's/^[[:space:]]*//' | cut -d' ' -f1

# Checked for installed CLT
if [[ -e "/Library/Developer/CommandLineTools/usr/bin/git" ]]
then
  exit 0
fi

