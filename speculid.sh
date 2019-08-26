find "Graphics" -name "*.speculid" -print0 |
while IFS= read -r -d $'\0' line; do
speculid --process "$line" &
done
wait