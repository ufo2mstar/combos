# print_mtd =-> mtd, vrbls { eval "@i = 0; #{mtd}(#{vrbls.join ','}) { |x, y, z| pr \"\#{@i+=1} \#{x}_\#{y}\#{z} \n\", :rnd }; p" }
# print_mtd['power_pair', %w[a b]]

a=(1..10).to_a
n=5

res = []
lam =-> {p b=a.shuffle; res << b }

n.times { | | lam[]}
n.times { | | lam[]}
n.times { | | lam[]}
srand 123; n.times { | | lam[]}
srand 123; n.times { | | lam[]}
srand 123; n.times { | | lam[]}

(res.length-n).times{|idx| puts "#{idx}: #{res[idx]} , #{res[idx+n]} : #{res[idx] == res[idx+n] }"}