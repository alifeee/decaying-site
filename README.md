a decaying version of my homepage

<http://mycelium.alifeee.net/>

main repository: <https://github.com/alifeee/alifeee.github.io>

decays using a [script](./decay_mycelium.sh), a GitHub deploy key, and a cron job:

```crontab
0 3 * * * (cd ~/git/decaying-site/; ./decay_mycelium.sh >> cron.log 2>&1)
```
