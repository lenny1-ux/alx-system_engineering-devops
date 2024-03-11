#Virtualbox Crushing

2024-02-07, 2024-02-09
#Issue Summary

The following report explains my computer freezing while using Vagrant to boot up. The machine index was corrupted from the freeze, and  vagrant box was not accessible. Went through several troubleshooting steps to resolve the issue, and eventually got my machine back up.
Timeline (All times in GMT)
2024-02-07

    16:30 - Computer froze due to overheating; Hard shutdown and reboot
    16:35 - Attempted to boot virtual machine through vagrant, but it failed
    16:45 - Resolved several configuration issues, but VM remained inaccessible
    16:55 - Data was recovered, and VM was booted by resolving more configuration issues
    17:00 - Fix auxilliary configuration problems
    17:15 - Installed temperature monitoring tool, and fan speed monitoring tools
    17:45 - Took apart computer and discovered fans are operational, but do not spin when system finishes booting
    18:00 - Decided on a temporary cooling solution, until an external piece of hardware could be implemented

2024-08-02

    11:30 - Purchased laptop cooling pad as a permanent hardware based cooling solution.

#Root Cause

At 16:30 GMT, computer froze due to overheating while a virtual machine was booting. After recovering lost data, further investigation into the issue revealed that the fan does not operate when the operating system finishes booting, due to misconfigured or non-existent drivers. Additionally, there was no temperature monitoring solution that would have alerted the user to manually cool the hardware.
System Specifications

Hardware: Dell Inspiron X57 Laptop (2022)

    CPU: Intel(R) Core(TM) i7-5200U CPU @ 2.20GHz
    RAM: 8GB Installed onboard. Model: Hynix/Hyundai 1600 MHz (S/N)CAF7D895
    GPU: Onboard: Broadwell-U Integrated Graphics, 33MHz Clock
    Boot Drive: Internal SanDisk SDSSDA24 Solid State Drive, 223GB Operating System: Ubuntu 20.04.5 LTS Xenial
    Kernel: 4.4.0-75-generic x86_64
    Desktop Environment: LXDE (Lubuntu)

#Detailed Resolution and Recovery
#Recovery of virtual development environment

 0   Error:
The machine index which stores all required information about
running Vagrant environments has become corrupt. This is usually
caused by external tampering of the Vagrant data folder.

Vagrant cannot manage any Vagrant environments if the index is
corrupt. Please attempt to manually correct it. If you are unable
to manually correct it, then remove the data file at the path below.
This will leave all existing Vagrant environments "orphaned" and
they'll have to be destroyed manually.

Path: C:/Users/Username/.vagrant.d/data/machine-index/index
Corrupted index file, Stack overflow


 1.   Navigated to ~/.vagrant.d/data/machine-index/ and ran the command: rm -f *

 2.   Next, encountered this error:
 The VirtualBox VM was created with a user that doesn't match the current user running Vagrant. VirtualBox requires that the same user be used to manage the VM that was created. Please re-run Vagrant with that user. This is not a Vagrant issue.

The UID used to create the VM was:
Your UID is: 45


 3.   Navigated to ~/Documents/.vagrant/machines/default/virtualbox/ and ran this command: echo -n 1000 >> creator_uid && vagrant up

 4.   Vagrant brought up a new machine, not my original VM. Had to get my original VM back. vagrant box disconnected

 5.   Navigated to: ~/Virtualbox\ VMs/Documents_default_1492630824800_98335/Documents_default_1492630824800_98335.vbox-prev and located this line:
  <Machine uuid="{db179e00-3ba1-4e08-a86a-ad7ab69ddac4}" name="Documents_default_1496197504242_4039" OSType="Ubuntu_64" snapshotFolder="Snapshots" lastStateChange="2017-04-18T22:10:38Z">

  6. Navigated to: /home/concati/Documents/.vagrant/machines/default/virtualbox and ran this command:
echo -n db179e00-3ba1-4e08-a86a-ad7ab69ddac4 > id
vagrant up


  7.  Original development environment virtual machine was recovered, started a clean up process
  8.  Destroyed all other machines that I didn't need through the virtualbox GUI.


#Preventative Measures
It will be necessary to look into this problem in the future, but for now, the laptop cooling pad solution has the system operating within acceptible ranges. Further investigation into the fan configuration problem is overshadowed by higher priorities.

#Author

Leonard Sammy
