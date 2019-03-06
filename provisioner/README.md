steps

# --- this part would be provisioned in tar format in the future
sudo yum install -y git
git clone --recursive https://github.com/guofengzh/kubespray-cn.git
cd kubespray-cn
git checkout avic

copy offline files

unable to find python.h even though it recognizes libffi
unable to find ffi.h even though it recognizes libffi

CentOS 7.5 -- 7.6好像没见这样的问题
sudo yum -y install python-devel libffi-devel openssl-devel
sudo yum -y install openssl-devel

[vagrant@admin /]$ tar --exclude='vagrant/files' --exclude='vagrant/.git' --exclude='vagrant/.vagrant' -czvf ~/kubespra
y-cn.tar.gz vagrant/

#
./provision-ansible
Collecting PyYAML (from ansible!=2.7.0,>=2.6.0->-r ./repo/requirements-ansible.txt (line 1))
  Could not find a version that satisfies the requirement PyYAML (from ansible!=2.7.0,>=2.6.0->-r ./repo/requirements-ansible.txt (line 1)) (from versions: )
  然后出现：
  [root@ecs-a014-0004 provisioner]# pip
Traceback (most recent call last):
  File "/usr/bin/pip", line 6, in <module>
    from pip._internal import main
ImportError: No module named _internal
需要运行：
[root@ecs-a014-0004 provisioner]# sudo python -m pip install --upgrade pip
Collecting pip
  Downloading https://files.pythonhosted.org/packages/d8/f3/413bab4ff08e1fc4828dfc59996d721917df8e8583ea85385d51125dceff/pip-19.0.3-py2.py3-none-any.whl (1.4MB)
    100% |████████████████████████████████| 1.4MB 33kB/s 
Installing collected packages: pip
  Found existing installation: pip 7.1.2
    Uninstalling pip-7.1.2:
      Successfully uninstalled pip-7.1.2
Successfully installed pip-19.0.3

这之后,再运行provision-ansible就成功了

出现:
./sshpass-1.06-2.el7.x86_64.rpm: does not update installed package.

./provision-nodes

    "rc": 43, 
    "start": "2019-03-05 14:22:06.557908", 
    "stderr": "warning: /tmp/docker-tmp/containerd.io-1.2.4-3.1.el7.x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 621e9f35: NOKEY\nerror: Failed dependencies:\n\taudit-libs(x86-64) = 2.8.4-4.el7 is needed by audit-libs-python-2.8.4-4.el7.x86_64\n\tselinux-policy >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch\n\tselinux-policy-base >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch\n\tselinux-policy-targeted >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch\n\tglibc-common = 2.17-260.el7_6.3 is needed by glibc-2.17-260.el7_6.3.i686\n\tlibsemanage = 2.5-14.el7 is needed by libsemanage-python-2.5-14.el7.x86_64\n\tlibselinux-utils >= 2.5-14 is needed by policycoreutils-2.5-29.el7_6.1.x86_64\n\tlibsemanage >= 2.5-14 is needed by policycoreutils-2.5-29.el7_6.1.x86_64\n\tlibcryptsetup.so.12()(64bit) is needed by systemd-219-62.el7_6.5.x86_64\n\tlibcryptsetup.so.12(CRYPTSETUP_2.0)(64bit) is needed by systemd-219-62.el7_6.5.x86_64", 
    "stderr_lines": [
        "warning: /tmp/docker-tmp/containerd.io-1.2.4-3.1.el7.x86_64.rpm: Header V4 RSA/SHA512 Signature, key ID 621e9f35: NOKEY", 
        "error: Failed dependencies:", 
        "\taudit-libs(x86-64) = 2.8.4-4.el7 is needed by audit-libs-python-2.8.4-4.el7.x86_64", 
        "\tselinux-policy >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch", 
        "\tselinux-policy-base >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch", 
        "\tselinux-policy-targeted >= 3.13.1-216.el7 is needed by container-selinux-2:2.74-1.el7.noarch", 
        "\tglibc-common = 2.17-260.el7_6.3 is needed by glibc-2.17-260.el7_6.3.i686", 
        "\tlibsemanage = 2.5-14.el7 is needed by libsemanage-python-2.5-14.el7.x86_64", 
        "\tlibselinux-utils >= 2.5-14 is needed by policycoreutils-2.5-29.el7_6.1.x86_64", 
        "\tlibsemanage >= 2.5-14 is needed by policycoreutils-2.5-29.el7_6.1.x86_64", 
        "\tlibcryptsetup.so.12()(64bit) is needed by systemd-219-62.el7_6.5.x86_64", 
        "\tlibcryptsetup.so.12(CRYPTSETUP_2.0)(64bit) is needed by systemd-219-62.el7_6.5.x86_64"
    ], 
    "stdout": "", 
    "stdout_lines": []
}

TASK [nexus : Load image from archive] **************************************************************************************************************
Tuesday 05 March 2019  16:24:31 +0800 (0:00:01.985)       0:00:09.259 ********* 
fatal: [127.0.0.1]: FAILED! => {"changed": false, "msg": "Error connecting: Error while fetching server API version: Timeout value connect was Timeout(connect=60, read=60, total=None), but it must be an int, float or None."}
        to retry, use: --limit @/root/kubespray-cn/playbook.retry



./provision-k8s
