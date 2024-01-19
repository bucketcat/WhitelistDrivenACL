#!/bin/bash

# Create dirs; data, admin, and market.
mkdir -v data admin market

# Debug: Display the ACLs for data, admin, and market directories.
getfacl data admin market

# Add users with home directories.
adduser -m AdamA
adduser -m PeterP
adduser -m LisaP

# Create groups.
groupadd datagroup
groupadd admingroup
groupadd marketgroup

# Set group ownership (commented out as it's not used in this version. Group ownership would not ). Also, root:root doesn't work for some reason. Also, redundant.
# chgrp root:root datagroup marketgroup admingroup

# Set privs for owner to read, write, and execute (rwx).
chmod 700 data admin market

# Set group ownership for data, admin, and market directories.
chown :datagroup data
chown :admingroup admin
chown :marketgroup market

# Set ACLs to grant specific users access to the data directory.
setfacl -m u:AdamA:rwx data
setfacl -m u:PeterP:rwx data

# Add users to the datagroup.
usermod -aG datagroup AdamA
usermod -aG datagroup PeterP

# Set ACLs to grant specific users access to the admin directory.
setfacl -m u:AdamA:rwx admin
setfacl -m u:LisaP:rwx admin

# Add users to the admingroup.
usermod -aG admingroup AdamA 
usermod -aG admingroup LisaP

# Set ACLs to grant specific users access to the market directory. a
setfacl -m u:PeterP:rwx market
setfacl -m u:LisaP:rwx market

# Add users to the marketgroup.
usermod -aG marketgroup PeterP
usermod -aG marketgroup LisaP

# Debug again.
getfacl data admin market
