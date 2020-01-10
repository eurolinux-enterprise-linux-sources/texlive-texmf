#!/usr/bin/env ruby

# require 'profile'

n, t = 100, Time.now

$: << File.dirname(File.expand_path($0))

require 'base/kpseremote'

kpse = KpseRemote.new # fast start (.25 sec)
# kpse = KpseRemote::fetch # slow start (1-2 sec)

# puts kpse.inspect

exit unless kpse

if true then

    n = 1
    loop do
        str = kpse.find_file('texnansi.enc')
        puts("#{n}: #{str}")
        n += 1
        sleep(1)
    end

else

    print((Time.now-t).to_s + ' ')
    n.times do |i|
        str = kpse.find_file('texnansi.enc')
        if i == 0 then
            print(Time.now-t).to_s + ' '
            print str
        else
            print ' .'
        end
    end
    puts ' ' + ((Time.now-t)/n).to_s

end
