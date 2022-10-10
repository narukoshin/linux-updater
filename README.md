<h1>📜  Linux updater</h1>
<div>
    <a target="_blank" href="https://twitter.com/narukoshin"><img src="https://media4.giphy.com/media/iFUiSYMNPvIJZDpMKN/giphy.gif?cid=ecf05e471v5jn6vuhczu1tflu2wm7qt11atwybfwcgaqxz38&rid=giphy.gif&ct=s" align="middle" width="120"></a>
    <a target="_blank" href="https://instagram.com/naru.koshin"><img src="https://media1.giphy.com/media/Wu9Graz2W46frtHFKc/giphy.gif?cid=ecf05e47h46mbuhq40rgevni5rbxgadpw5icrr71vr9nu8d4&rid=giphy.gif&ct=s" align="middle" width="120"></a>
    <a target="_blank" href="https://tryhackme.com/p/narukoshin"><img align="middle" src="https://www.secjuice.com/content/images/2019/01/TryHackMe-logo---small.png" width="120"></a>
  </div>
  
<h1>💁‍♂️  About the script</h1>
<p>
  The main task for this script is to maintain linux server up-to-date by installing the latest updates on itself.
</p>

<p>
  To do this, you need to place this script somewhere in the linux server, I recommend you to do it in the /root directory, add root permissions to read and execute:
</p>

```py
chown root:root updater.sh # set root as the owner
chmod 500 updater.sh # set read and execute permission
```
...and set the cronjob to run this script every day:
```java
# crontab -u root -e
@daily /root/updater/updater.sh
```
<p>
On very first run it created a `logs` folder in the main directory that you specified in the bash file. In the logs folder will be stored logs of the update, what's installed and all the errors if there is any.
</p>
