module ComponentsHelper

	def build_modal(header:, btn_options: {}, &content)
		render 'components/modal', title: header, button_handler: btn_options do
			content.call if content
		end
	end
end