id=$(xinput list --id-only pointer:'  mini keyboard')
echo 'Device number:' $id
xinput set-button-map $id 3 2 1
xinput get-button-map $id
