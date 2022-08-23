import Config

if Mix.env() == :dev do
  config(:gen_chatting_dets, node_env: :dev)
end
