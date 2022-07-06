module ApplicationHelper
    def active_class(control)
        current_page?(controller: control) ? "bg-zinc-700 rounded-r-2xl" : ""
    end
end
