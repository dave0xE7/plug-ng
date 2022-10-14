

debFile='this.deb'

dpkg-deb --build src $debFile

dpkg-deb --info $debFile
dpkg-deb --show $debFile
dpkg-deb --contents $debFile