require 'rubygems'
require 'bundler/setup'

# myapp.rb
require 'sinatra'
require 'json'

variables = ['HOSTNAME','OPENSHIFT_BUILD_NAME']

get '/' do
  output = "Hello.</br>"
  #output += ENV.to_a.to_s
  mylist = ENV.to_a.select {|x| variables.include?(x[0]) }[0]
  output += JSON.pretty_generate(mylist) + DateTime.now.strftime('</br>%H:%M:%S')
  output
end
