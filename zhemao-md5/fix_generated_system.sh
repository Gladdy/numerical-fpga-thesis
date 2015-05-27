#!/bin/sh

cp soc_system/synthesis/soc_system.v soc_system/synthesis/soc_system.v.bak
head -n 29 soc_system/synthesis/soc_system.v > soc_system_head.v
tail -n +31 soc_system/synthesis/soc_system.v > soc_system_tail.v

cat soc_system_head.v - soc_system_tail.v > soc_system_tmp.v <<EOF
                output wire [8:0]  md5_input_writeaddr,
                output wire        md5_input_write
EOF

sed -e 's/md5_input_addr/md5_input_writeaddr/g' \
    -e 's/md5_input_data/md5_input_writedata/g' \
    -e 's/md5_write.*()/md5_write     (md5_input_write)/g' \
    soc_system_tmp.v > soc_system/synthesis/soc_system.v

rm soc_system_*.v
