module ComponentsHelper
	def build_accordion(active_color: '', header: '', collapsed: 'true', &body)
		render 'components/accordion', active_color:, header:, collapsed:  do
			body.call if body
		end
	end

	def build_search_form(url:, content_target:, input_name:, input_placeholder: '')
		render 'components/search_form', url:, content_target:, input_name:, input_placeholder:
	end


	def build_modal(modal_id:, button_text:, header_modal:, &body)
		render 'components/modal', modal_id:, button_text:, header_modal: do
			body.call if body
		end
	end

	
end