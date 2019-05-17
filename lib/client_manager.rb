module ClientManager
  def add_reaction(client, data, name)
    # スタンプを押す
    client.web_client.reactions_add(
      name: name,
      channel: data.channel,
      timestamp: data.ts,
      as_user: true)
  end
end
