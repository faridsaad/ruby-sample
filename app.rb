require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'

variables = ['HOSTNAME','OPENSHIFT_BUILD_NAME','OPENSHIFT_BUILD_COMMIT']

get '/' do
    output =""
    mylist = ENV.to_a.select {|x| variables.include?(x[0]) }
    mylist.each do |x|
        output += "#{x[0]}=#{x[1]}</br>"
    end
    output += DateTime.now.strftime('</br>%H:%M:%S')
    output
end
