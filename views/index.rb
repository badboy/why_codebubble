class CodeBubble
  module Views
    class Index < Layout
      def language_options
        CodeRay::Scanners.list.sort.map { |scanner|
          $stderr.puts "#{scanner} == #{@lang}"
          %{<option value="#{scanner}"#{scanner==@lang?' selected="selected"':''}>#{scanner}</option>}
        }.join("\n")
      end

      def code
        @code
      end

      def code_raw
        @code_raw
      end

      def is_posted
        @posted
      end
    end
  end
end
