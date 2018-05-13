require "simplecov"

SimpleCov.start "rails" do
  add_filter "/app/jobs/"
  add_filter "/app/channels/"
  add_filter "/app/mailers/"
  add_filter "/bin/"
  add_filter "/db/"
  add_filter "/spec/"
  add_filter "/.direnv/"
end