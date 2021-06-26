Thunderbird daily installer package for Debian / Ubuntu
=======================================================

![ThunderbirdNightly](daily.png?raw=true "Nightly logo")

Thunderbird Nightly gets a new version every day and as a consequence, the release notes for the Nightly channel are updated continuously to reflect features that have reached sufficient maturity to benefit from community feedback and bug reports. Features listed here may or may not make a final release of Thunderbird.


Building package
----------------

```shell  
    apt-get -y install devscripts dpkg-dev
    git clone https://github.com/Vitexus/ThunderbirdDailyDeb.git
    debuild -i -us -uc -b
```

Installation
------------

Download from http://repo.vitexsoftware.cz/pool/buster/main/n/nightly/ or Build package. Then install:

```shell
    gdebi daily_80.0a1_all.deb
```

Or you can use repo:

```shell
sudo apt install lsb-release wget apt-transport-https bzip2
sudo wget -O /usr/share/keyrings/vitexsoftware.gpg https://repo.vitexsoftware.cz/keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/vitexsoftware.gpg]  https://repo.vitexsoftware.cz  $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
sudo apt update
sudo apt install daily
```

![About Window](thunderbird-daily-about.png?raw=true "About")

See also: https://github.com/Vitexus/FirefoxNightlyDeb https://github.com/VitexSoftware/FirefoxDevelEditionDeb
