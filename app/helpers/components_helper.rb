module ComponentsHelper
	def build_accordion(active_color: '', header: '', &body)
		render 'components/accordion', active_color:, header:  do
			body.call if body
		end
	end

	def build_search_form(url:, content_target:, input_name:, input_placeholder: '')
		render 'components/search_form', url:, content_target:, input_name:, input_placeholder:
	end
end