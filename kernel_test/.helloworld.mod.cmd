savedcmd_/home/fyj/DiskN/kernel_test/helloworld.mod := printf '%s\n'   helloworld.o | awk '!x[$$0]++ { print("/home/fyj/DiskN/kernel_test/"$$0) }' > /home/fyj/DiskN/kernel_test/helloworld.mod
