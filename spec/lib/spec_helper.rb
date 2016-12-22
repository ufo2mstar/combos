$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)


require "combos"
include Combos

API_METHODS = %w[power_pair serial_pair random_pair combo_pair]

RESET_RAND=->{srand 123} # setting this for repeatable testing of random methods
NUMS, WORDS, CHARS = [1, 2, 3, 4], %w[a b c], ['#' , '!']

if __FILE__ == $0
  tic
  # require_relative '../../useful_support/action_files/yaml_rider'
  # include YamlRider
end
if __FILE__ == $0
  # power pair
  m, n, o = [1, 2, 3, 4], ['a', 'b', 'c'], ['&', '#']
  p power_pair m, n, o
  p power_pair m
  power_pair(m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  power_pair(m) { |x| pr "#{x} ", :rnd }; p; p # not sure how the one array power pair is gonna work!
  #   smart_pair.. direct use depricated.. use random_pair or serial_pair instead
  # smart_pair("rand", m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  # p smart_pair "rand", m, n, o
  # p smart_pair "rand", m
  # p smart_pair "rand"
  # smart_pair(false, m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  # p smart_pair false, m, n, o
  # p smart_pair nil, m
  # p smart_pair false
  # random_pair

  # random_pair(m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  # p random_pair m, n, o
  # p random_pair m
  # p random_pair
  # # serial_pair
  # serial_pair(m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  # p serial_pair m, n, o
  # p serial_pair m
  # p serial_pair

  # combo_pair(10, m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  # p combo_pair 10, m, n, o
  # p combo_pair 10, m
  combo_pair(2, m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  p combo_pair 2, m, n, o
  p combo_pair 2, m, n
  p combo_pair 2, m
  # p combo_pair
end
if __FILE__ == $0
  file_loc  = File.dirname(__FILE__)
  # p path = (Dir[file_loc+"/../../pages/**/*year*.yml"].first)
  # p path = (Dir[file_loc+"/../../**/03_Gen*/**/*AR.yml"].first)
  # p;p toc
  path      = (Dir[file_loc+"/../../../**/02*/**/happy*.yml"].first)
  # p;p toc

  print_mtd =-> mtd { eval "count.call('#{mtd}') {@itr = 0 ; #{mtd}(*res) { |*itms| pr \"\#{int[@itr+=1,3]}: \#{itms[0].join('\t; ')} \\n\", :rnd }; p}" }
  p "Files:\n#{path}"
  erb = erb_eval(path)
  print erb
  # p;p toc
  # print erb.to_yaml
  res   = erb.values
  count =-> name, &blk { tic 'pair'; blk.call; toc 'pair', 'for '+name }
  int   =-> i, pad { "%0#{pad}d" % i.to_i }
  count.call('power_pair') { @itr = 0; power_pair(*res) { |*itms| pr "#{int[@itr+=1, 6]}- #{itms[0]}   \n", :rnd }; p }
  count.call('random_pair') { @itr = 0; random_pair(*res) { |*itms| pr "#{int[@itr+=1, 2]}- #{itms[0]}   \n", :rnd }; p }
  # count.call('serial_pair') {@itr = 0 ; serial_pair(*res) { |*itms| pr "#{int[@itr+=1,3]}- #{itms[0]}   \n", :rnd }; p}
  # mtds = %w(random_pair serial_pair power_pair)
  mtds = %w(random_pair serial_pair)
  mtds.each { |mtd| print_mtd[mtd] }

  a =%w[BA_PS
BA_NONE
BA_LOC
BA_CNT
BA_DIR]

  # Fire Alarm
  b =%w-FA_PS
FA_NONE
FA_LOC
FA_CNT
FA_DIR-

  # Sprinkler System
  c =%w+SS_PS
SS_NONE
SS_PART
SS_FULL+
  p a
  p b
  p c
  print_mtd =-> mtd, vrbls { eval "@i = 0; #{mtd}(#{vrbls.join ','}) { |x, y, z| pr \"\#{x} \#{x} \#{y} \#{z} \n\", :rnd }; p" }
  print_mtd['power_pair', %w[a b c]]
end
if __FILE__ == $0
  a= %w[NO LO CN DR]
  b= %w[NO LO CN DR]
  c= %w[NO PT FU]

  # a= %w[FLAT_RESIDENCE TOWNHOUSE_RESIDENCE LOFT_RESIDENCE SING_FAM_DWELLING_RESIDENCE DUPLEX_RESIDENCE]
  # b= %w[STUDIO_BEDROOM 1_BEDROOM 2_BEDROOM 3_BEDROOM 4_BEDROOM 5+_BEDROOM]
  # c= %w[]

  p a
  p b
  p c
  print_mtd =-> mtd, vrbls { eval "@i = 0; #{mtd}(#{vrbls.join ','}) { |x, y, z| pr \"\#{@i+=1} \#{x}_\#{y}\#{z} \n\", :rnd }; p" }
  print_mtd['power_pair', %w[a b]]
  # p smart_pair a,b,c
  m, n, o = a, b, c
  random_pair(m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  p random_pair m, n, o
  p random_pair m
  p random_pair
  # serial_pair
  serial_pair(m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  p serial_pair m, n, o
  p serial_pair m
  p serial_pair
  combo_pair(10, m, n, o) { |x, y, z| pr "#{x} #{y} #{z} \n", :rnd }; p
  p combo_pair 10, m, n, o
  p combo_pair 10, m
  p combo_pair 10, []
end

