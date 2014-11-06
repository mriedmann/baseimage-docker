#!/bin/bash

${ETCD:?Error \$ETCD is not defined}

# Try to make initial configuration every 5 seconds until successful
until confd -onetime -node $ETCD; do
    echo "[confd] waiting to create initial configuration."
    sleep 5
done
