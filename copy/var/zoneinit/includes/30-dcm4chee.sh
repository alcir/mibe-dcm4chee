# Unpack dcm4chee installation 
# make link and chown

log "unpack dcm4chee"
tar -C /export -xzf /var/tmp/dcm4chee-2.17.3-mysql.tar.gz

log "dcm4chee link and chown"
ln -s /export/dcm4chee-2.17.3-mysql /export/dcm4chee
chown -R dcm4chee /export/dcm4chee-2.17.3-mysql

# Import dcm4chee SMF manifest
# and disable the service (maybe not necessary)

log "import dcm4chee manifest"
svccfg import /export/dcm4chee/bin/dcm4chee-manifest.xml

log "stopping dcm4chee"
svcadm disable dcm4chee

rm -rf /var/tmp/dcm4chee-2.17.3-mysql.tar.gz

# Unpack and install various
# dicom tools

log "unpack dcm4che3 tools"
mkdir /opt/dcmtools
tar -C /opt/dcmtools -xzf /var/tmp/dcm4che-3.2.1.tar.gz
ln -s /opt/dcmtools/dcm4che-3.2.1 /opt/dcmtools/dcm4che3

rm -rf /var/tmp/dcm4che-3.2.1.tar.gz

log "install dcmtk"
pkg_add /var/tmp/dcmtk-3.6.0.tgz
