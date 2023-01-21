module ComponentsHelper
	def build_accordion(active_color: '', header: '', &body)
		render 'components/accordion', active_color:, header:  do
			body.call if body
		end
	end
end