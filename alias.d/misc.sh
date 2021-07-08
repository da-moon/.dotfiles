alias dl="aria2c --optimize-concurrent-downloads -k 1M -j16 -x 16 -c --file-allocation=falloc"
alias nocmt="sed -e '/#/d' -e '/^[[:space:]]*$/d'"
alias pprintenv="printenv | awk 'BEGIN{FS=OFS=\"=\";}{printf \"%-30s%-18s\n\",\$1,\$2}'"