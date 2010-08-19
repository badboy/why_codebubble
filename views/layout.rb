class CodeBubble
  module Views
    class Layout < Mustache
      def title
        @title || 'whyday'
      end
    end
  end
end
