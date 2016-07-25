module ApplicationHelper
  def mark(link)
    if link.false?
      "<button id=mark-btn class=read-btn data-btn-class=read>Mark as Read</button>".html_safe
    else
      "<button id=mark-btn class=unread-btn data-btn-class=unread>Mark as Unread</button>".html_safe
    end
  end
end
