module ApplicationHelper
    def full_title(page_title)
        base_title = ""
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end

    # def note_tag(all,true_counter)
    #     ("Вы решили #{true_counter} задач из #{all}" + \
    #     "Предполагаемая оценка <br>" + \
    #     "<note> #{(5*(true_counter/all))} </note>").html_safe
    # end
end
