module ApplicationHelper
  
  def title(page_title)
    content_for(:title) {page_title}
  end
  
  def yesno(value)
    if (value == true) 
      return 'yes'
    end
    return 'no'
  end
  
end
