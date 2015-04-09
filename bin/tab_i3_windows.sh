#!/bin/bash

id=`python ~/.i3/bin/id_list_i3.py`
echo $id
i3-msg [id="$id"] focus > /dev/null
