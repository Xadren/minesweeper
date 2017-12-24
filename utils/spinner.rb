class Spinner

    def initialize (spinner_message)

        spinner = Enumerator.new do |e|
            loop do
                e.yield '|'
                e.yield '/'
                e.yield '-'
                e.yield '\\'
            end
        end
        
        begin
            printf("\r%s: %s", spinner_message, spinner.next)
            sleep(0.1)
        end until

        print "\n"
    end
    
end