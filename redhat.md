# RHEL: Red Hat Enterprise Linux

- download: [Red Hat Enterprise Linux](https://developers.redhat.com/products/rhel/download)

## Start

### Subscription Manager

- article: [How to renew your Red Hat Developer Subscription for Red Hat Enterprise Linux](https://developers.redhat.com/articles/renew-your-red-hat-developer-program-subscription#how_to_re_register_for_your_red_hat_developer_subscription)
- redhat: [https://access.redhat.com/management](https://access.redhat.com/management)

1. **Disabled**: Simple content access for Red Hat Subscription Management
2. Get **Red Hat Developer Subscription for Individuals**

```bash
sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean
sudo subscription-manager register
sudo subscription-manager refresh
sudo subscription-manager attach --auto

# sudo subscription-manager list --available
# sudo subscription-manager attach --pool=<POOL-ID>
```

### sudo

```bash
su
usermod -aG wheel <USER>
```

### EPEL: Extra Packages for Enterprise Linux

- doc: [epel](https://docs.fedoraproject.org/en-US/epel/)

```bash
subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
```
