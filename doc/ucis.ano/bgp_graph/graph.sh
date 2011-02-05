#!/bin/sh
./path_list_to_dot.php < /home/vpn/public_html/.stats/bgp_paths.txt | \
twopi -T svg -o /home/vpn/public_html/.stats/anonet.svg
