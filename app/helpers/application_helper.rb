module ApplicationHelper
  def alphebetize(collection)
    case when collection.first.class == Show
      collection.sort_by { |s| s.title }
    else
      collection.sort_by { |s| s.name }
    end
  end
end
