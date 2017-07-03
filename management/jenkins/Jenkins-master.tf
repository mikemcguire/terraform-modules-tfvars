resource "digitalocean_droplet" "jenkins-master" {
    image = "ubuntu-14-04-x64"
    name = "jenkins-master"
    region = "sfo1"
    size = "1gb"
    private_networking = true

    # Provisioners go here
}