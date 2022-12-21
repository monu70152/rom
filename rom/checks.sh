#!/bin/bash

# green
msg() {
    echo -e "\e[1;32m$*\e[0m"
}
# red
msg1() {
    echo -e "\e[1;31m$*\e[0m"
}
# yellow
msg2() {
    echo -e "\e[1;33m$*\e[0m"
}
# purple
msg3() {
    echo -e "\e[1;35m$*\e[0m"
}

name_rom=$(grep init $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d / -f 4)
device=$(grep lunch $CIRRUS_WORKING_DIR/build.sh -m 1 | cut -d ' ' -f 2 | cut -d _ -f 2 | cut -d - -f 1)
branch_name=$(grep init $CIRRUS_WORKING_DIR/build.sh | awk -F "-b " '{print $2}' | awk '{print $1}')

echo ""
msg2 "Cek Keamanan"
AUTHOR=$(cd $CIRRUS_WORKING_DIR && git log --pretty=format:'%an' -1)
msg3 $AUTHOR
if [[ $AUTHOR == monu70152™ ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
elif [[ $AUTHOR == monuforservrr™ ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
elif [[ $AUTHOR == monu2k ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
elif [[ $AUTHOR == monu3k ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
elif [[ $AUTHOR == monu4k ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
elif [[ $AUTHOR == monu5k ]]; then
    echo "==============================="
    msg OK
    echo "==============================="
else
    echo "==============================="
    msg1 sorry you are not allowed
    echo "==============================="
    exit 1
fi
echo ""
echo ""
msg2 "Building Rom Information"
echo "==============================="
msg "Rom Name = $name_rom"
msg "Branch = $branch_name"
msg "Devices = $device"
echo "==============================="
echo ""
if [[ "$CIRRUS_USER_PERMISSION" == "admin" ]]; then
    echo "==============================="
    msg You are the admin, you are free to do whatever you want.
    echo "==============================="
fi
if [[ "$CIRRUS_USER_PERMISSION" == "write" ]]; then
    echo "==============================="
    msg2 You are a user with write-only permissions, perhaps your actions are slightly restricted.
    echo "==============================="
fi
if [[ $CIRRUS_COMMIT_MESSAGE == "Update build_rom.sh" ]]; then
   echo "==============================="
   msg2 Write down the name of the commit, that's really lazy.
   echo "==============================="
   exit 1
fi
if [[ $BRANCH != $device-* ]]; then
   echo "==============================="
   msg2 Please use branch codename device-blablabla.
   echo "==============================="
   exit 1
fi
if [ -z "$CIRRUS_PR" ]; then
   echo "==============================="
   msg Builder By Team
   echo "==============================="
else
   echo "==============================="
   msg1 Benefit, Pull Request was rejected.
   echo "==============================="
   exit 1
fi
echo "$credentials" > ~/.git-credentials
git config --global credential.helper store --file=~/.git-credentials
echo ""
msg2 "🔐 Notes"
echo "==============================="
msg3 "To be part of our Team,
You can contact the admin in our telegram group at the link below:"
msg https://telegram.me/veux_builds
echo ""
msg2 "CR: Unknown"
echo "==============================="
