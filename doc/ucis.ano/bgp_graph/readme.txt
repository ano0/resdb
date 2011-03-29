These scripts can be used to graph the BGP peering connections in a network using the BGP protocol.

Some of the scripts will communicate with the BGP software, another script can be used to export the obtained information to a .dot file, which can then be converted to a graph file using graphviz. The scripts can run on different machines, and it is recommended to use routing information from multiple routes, to obtain an accurate view of the network.

Depending on the BGP software, one of the following scripts must be used to acquire the data:
- bgp_path_list_bird.sh (or .php) for the bird routing daemon
- bgp_path_list_quagga.sh (or .php) for the quagga/zebra routing daemon
- bgp_path_list_xml.php to convert existing dn42/diac42 .xml data

All these scripts will send their output to the stdout, so you either have to pipe them to another script, or redirect their output to a file (examples below).

Inside the scripts are a few configuration options. You should configure your local AS number (mynode/LOCALNODE variable) for proper operation. You may also change authentication parameters, for the quagga script.

To create the graph, you will need the path_list_to_dot.php script, this script expects the collected path data on STDIN, and will send the DOT-data to STDOUT (examples below). The DOT-data can be sent to one of the graphviz utilities (the dot command often performs best).

EXAMPLES

Graphing one single local bird instance
$ ./bgp_path_list_bird.sh | ./path_list_to_dot.php | dot -T png -o graph.png

Graphing one single quagga instance
$ ./bgp_path_list_quagga.sh | ./path_list_to_dot.php | dot -T png -o graph.png

Graphing data from one local bird instance and one quagga instance
$ ./bgp_path_list_bird.sh > /tmp/paths.txt
$ ./bgp_path_list_quagga.sh >> /tmp/paths.txt
$ ./path_list_to_dot.php < /tmp/paths.txt | dot -T png -o graph.png

You can combine data from as many routers as you like. More is better, because it will make the graph more accurate.

Or, in one single line:
$ (./bgp_path_list_bird.sh; ./bgp_path_list_quagga.sh) | ./path_list_to_dot.php < /tmp/paths.txt | dot -T png -o graph.png

Graphing a remote quagga instance using http:
$ wget http://remotehost/bgp_path_list_quagga.php -O - | ./path_list_to_dot.php < /tmp/paths.txt | dot -T png -o graph.png

Alternatively, you can use a cron job on the server to periodically update a static data file.

Graphing a remote instance using netcat:
server$ ./bgp_path_list_bird.sh | nc -l -p 9876
client$ nc remotehost 9876 | ./path_list_to_dot.php < /tmp/paths.txt | dot -T png -o graph.png

You can also use inetd/xinetd on the server side for a more permanent solution.


Be creative!
