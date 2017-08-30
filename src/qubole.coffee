# Description:
#   Interaction with Qubole Data Services APIs via Hubot framework
#
# Configuration:
#   HUBOT_QUBOLE_AUTH_TOKEN - Required
#   HUBOT_QUBOLE_BASE_URL - Optional
#
# Commands:
#   hubot command <id> status - Display the status of given command id
#   hubot cluster <id> status - Display the status of given cluster id
#   hubot cluster <id> nodes - Display the nodes information of given cluster id
#   hubot cluster <id> usage - Show the usage statistics for the given cluster id
#   hubot schedule <id> status - Display the status of given schedule id
#   hubot schedule <id> runs - Shows the last 10 run of a given schedule
#   hubot template <id> status - Display the status of given template id
#   hubot template <id> runs - Shows the last 10 run of a given template
#   hubot note <id> status - Display the status of a given notebook id
#   hubot qcuh - Shows the QCUH consumed in ongoing month
#
# Author:
#   Sumit Maheshwari <sumeet.manit@gmail.com>

module.exports = (robot) ->
  baseUrl = process.env.HUBOT_QUBOLE_BASE_URL || 'https://api.qubole.com/api/latest'
  authHeader = {'X-AUTH-TOKEN': process.env.HUBOT_QUBOLE_AUTH_TOKEN, 'Content-Type': 'application/json'}

  robot.respond /command (\d+) status$/i, (msg) ->
    cmd_id = msg.match[1]

    msg.http("#{baseUrl}/commands/#{cmd_id}.json").headers(authHeader).get() (err, res, body) ->

      if res.statusCode >= 500
        msg.send "Sorry, something went wrong :("
        return

      response = JSON.parse body

      if response.error
        msg.send "Error talking to Qubole: #{response.error.error_message}"
      else
        msg.send "Current status of #{cmd_id}(#{response.command_type}) is: #{response.status}"


  robot.respond /cluster (\d+) status$/i, (msg) ->
    cluster_id = msg.match[1]
    robot.http("#{baseUrl}/clusters/#{cluster_id}.json").headers(authHeader).get() (err, res, body) ->

      if res.statusCode >= 500
        msg.send "Sorry, something went wrong :("
        return

      response = JSON.parse body

      if response.error
        msg.send "Error talking to Qubole: #{response.error.error_message}"
      else
        msg.send "Current status of Cluster #{cluster_id} is: #{response.cluster.state}"


  robot.respond /cluster (\d+) nodes$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /cluster (\d+) usage$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /schedule (\d+) status$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /schedule (\d+) runs$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /template (\d+) status$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /template (\d+) runs$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /note (\d+) status$/i, (msg) ->
    msg.send "Not implemented yet"


  robot.respond /qcuh$/i, (msg) ->
    msg.http("#{baseUrl}/accounts/monthly_usage.json").headers(authHeader).get() (err, res, body) ->

      if res.statusCode >= 500
        msg.send "Sorry, something went wrong :("
        return

      response = JSON.parse body

      if response.error
        msg.send "Error talking to Qubole: #{response.error.error_message}"
      else
        msg.send "QCUH used so far for this month is: #{response.usage.qcuh}"
