Start by running ```vagrant up``` followed by ```vagrant ssh```.

    cd /opt/pixelated-user-agent/service
    source .virtualenv/bin/activate

    pixelated-user-agent --register example.wazokazi.is YOURUSERNAME

You will be prompted for a password.

Then run

    pixelated-user-agent --host=0.0.0.0

and you will need to paste in example.wazokazi.is, YOURUSERNAME and password. 


Finally, you should be able to see the UI at localhost:3333
