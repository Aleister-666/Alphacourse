module ComponentsHelper

	def build_modal(header:, btn_options: {}, &content)
		render 'components/modal', title: header, button_handler: btn_options do
			content.call if content
		end
	end

	def build_accordion(title:, h_classes: '', &content)
		render 'components/accordion', title: title, classes: h_classes  do
			content.call if content
		end
	end

	def build_dropdown(icon_classes:, box_style: '', &content)
		render 'components/dropdown', fa_icon_classes: icon_classes, box_style: box_style do
			content.call if content
		end
	end
end