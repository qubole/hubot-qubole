# hubot-qubole
Interaction with [Qubole](https://qubole.com) Data Services APIs via Hubot framework

## Configuration

* Register the auth token value as an environment variables when starting your bot (as usual with Hubot scripts).
 * `export HUBOT_QUBOLE_AUTH_TOKEN=your_auth_token`

* If you are not working on api.qubole.com, then you can override the api endpoint as well (optional)
 * `export HUBOT_QUBOLE_AUTH_TOKEN=https://<env>.qubole.com/api/latest`

If you are using Heroku to host your bot, replace `export ...` with `heroku set:config ...`.

## Adding to Your Hubot

See full instructions [here](https://github.com/github/hubot/blob/master/docs/scripting.md#npm-packages).

1. `npm install hubot-qubole --save` (updates your `package.json` file)
2. Open the `external-scripts.json` file in the root directory (you may need to create this file) and add an entry to the array (e.g. `[ 'hubot-qubole' ]`).

## Commands

- `hubot command <id> status` - Display an overall status of a command
- `hubot cluster <id> status` - Display the status of given cluster id
- `hubot cluster <id> nodes` - Display the nodes information of given cluster id
- `hubot cluster <id> usage` - Show the usage statistics for the given cluster id
- `hubot schedule <id> status` - Display the status of given schedule id
- `hubot schedule <id> runs` - Shows the last 10 run of a given schedule
- `hubot template <id> status` - Display the status of given template id
- `hubot template <id> runs` - Shows the last 10 run of a given template
- `hubot note <id> status` - Display the status of a given notebook id
- `hubot qcuh` - Shows the QCUH consumed in ongoing month