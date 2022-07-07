module ApplicationHelper
    def active_class(control, action = "index")
        current_page?(controller: control, action: action) ? "bg-zinc-700 rounded-r-2xl" : ""
    end
end
