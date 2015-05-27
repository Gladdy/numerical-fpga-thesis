onerror {resume}

add wave clk
add wave reset
add wave start
add wave readaddr
add wave -radix hexadecimal readdata
add wave done

run 5700 ns
