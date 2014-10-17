desc "tail logs files" 
task :tail_logs, :roles => :app do
  run "tail -f #{shared_path}/log/#{env}.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}" 
    break if stream == :err    
  end
end