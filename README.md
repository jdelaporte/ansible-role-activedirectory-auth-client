# Ansible Role: libnss-ldap + Active Directory

Ansible role to configure a Debian based server or switch with ldap
authentication to a Active directory server. For more details, see
the Cumulus Linux Article on [how to configure LDAP authentication to an
Active Directory server](http://bit.ly/18EbwKc)

## Requirements
- Ansible 1.6 and higher
- Active Directory with LDAP/SSL support _(role can be easily modified to just use LDAP
  with no ssl)
- root CA certificate of the Active Directory domain controller.


## Installation

Using `ansible-galaxy`:
```shell
$ ansible-galaxy install cumulus.ldap-auth-ad
```

Using `git`:
```shell
$ git clone
https://github.com/CumulusNetworks/ansible-role-activedirectory-auth-client

Copy the root CA certificate of the Active Directory to the switddch/server.

```

## Variables
See
[defaults/main.yml](https://github.com/CumulusNetworks/ansible-role-activedirectory-auth-client/blob/master/defaults/main.yml) for supported roles variables
```yaml
ldap_uri: "ldaps://my-adserver.rtp.example.test"
ldap_base_dn: "ou=support,dc=rtp,dc=example,dc=test"
ldap_bind_dn: "CN=cumulus admin,CN=Users,DC=rtp,DC=example,DC=test"
ldap_bind_passwd: "1Q2w3e4r!"
ldap_server_ssl_cert_location: "/etc/ssl/certs/rtp-example-ca.pem"
ldap_search_filter:
"cn=cumuluslnxadm,ou=groups,ou=support,dc=rtp,dc=example,dc=test"
ad_domain_sid: "S-1-5-21-1613317992-1820204577-3688399344"
```

## Example Playbook

```yaml
- hosts: all
  vars:
    ldap_uri: "ldaps://my-adserver.rtp.example.test"
    ldap_base_dn: "ou=support,dc=rtp,dc=example,dc=test"
    ldap_bind_dn: "CN=cumulus admin,CN=Users,DC=rtp,DC=example,DC=test"
    ldap_bind_passwd: "1Q2w3e4r!"
    ldap_server_ssl_cert_location: "/etc/ssl/certs/rtp-example-ca.pem"
    ldap_search_filter: "cn=cumuluslnxadm,ou=groups,ou=support,dc=rtp,dc=example,dc=test"
    ad_domain_sid: "S-1-5-21-1613317992-1820204577-3688399344"
  roles:
  - cumulus.linux-auth-ad

```

License
-------

GPLv2

![Cumulus icon](http://cumulusnetworks.com/static/cumulus/img/logo_2014.png)

### Cumulus Linux

Cumulus Linux is a software distribution that runs on top of industry standard
networking hardware. It enables the latest Linux applications and automation
tools on networking gear while delivering new levels of innovation and
ﬂexibility to the data center.

For further details please see:
[cumulusnetworks.com](http://www.cumulusnetworks.com)

## CONTRIBUTORS

- Stanley Karunditu (@skamithik)
