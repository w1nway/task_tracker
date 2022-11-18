module Comments
  class Save 
    include Interactor

    delegate :prepared_params, to: :context

    def call 
      context.comment = comment

      context.fail!(error: "Invalid data") unless comment.save

      private 

      def comment
        @comment ||= Comment.new(prepared_params)
      end
    end
  end
end
