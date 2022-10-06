<h1>📜  Linux updater</h1>
<p>
  The main task for this script is to maintain linux server up-to-date by installing the latest updates on itself.
</p>

<p>
  To do this, you need to place this script somewhere in the linux server, I recommend you to do it in the /root directory, add root permissions to read and execute:
</p>

```sh
chown root:root updater.sh # set root as the owner
chmod 500 updater.sh # set read and execute permission
```
...and set the cronjob to run this script every day:
```sh
# crontab -u root -e
@daily /root/updater/updater.sh
```
