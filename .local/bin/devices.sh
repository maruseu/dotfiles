echo "[1;32mUSB DEVICES

[31mBUS [32mDEV [34mID        [37mNAME"
lsusb | grep -v -i linux | sed 's/Bus /\[31m/g' | sed 's/Device /\[32m/g' | sed 's/: ID/[34m/g' | awk '$3 = $3 "[37m"' | cut -c -`expr $(tput cols) + 20`

echo "
[33mDISKS

[31mNAME            [32mMAJ:MIN [33mRM      [34mSIZE    [35mRO      [37mMOUNTPOINT"
lsblk -lp | grep -v MOUNTPOINT | awk '$6= " " '| awk '$1="[31m" $1' | awk '$2="[32m" $2' | awk '$3="[33m" $3' | awk '$4="[34m" $4' | awk '$5="[35m" $5' | awk '$6="[37m" $6' | sed 's/ /\t/g'
