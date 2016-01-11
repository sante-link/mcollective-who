module MCollective
  class Application
    class Who < MCollective::Application
      description "Reports logged on users"

      usage <<-END_OF_USAGE
mco who
END_OF_USAGE

      def main
        who = rpcclient('who')
        who_result = who.send('who')

        if !who_result.empty?
          sender_width = who_result.map{|s| s[:sender]}.map{|s| s.length}.max + 3
          pattern = "%%%ds: %%s" % sender_width

          who_result.each do |result|
            if result[:statuscode] == 0
              status = result[:data][:users].reject { |u| u == '(unknown)' }.join(', ')
            else
              status = 'absent'
            end

            puts(pattern % [result[:sender], status]) if status != ''
          end

          printrpcstats summarize: true, caption: 'who results'
          halt who.stats
        end
      end
    end
  end
end
