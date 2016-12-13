module ApplicationHelper
    def full_title(page_title)
        base_title = "PT"
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end

    def get_note(all,true_counter)
        if (5.0*(true_counter.to_f/all.to_f)) <= 2
            2.to_s
        else
            ((5.0*(true_counter.to_f/all.to_f)).to_i).to_s
        end
    end

    def step()
        0.1
    end
    # def note_tag(all,true_counter)
    #     ("Вы решили #{true_counter} задач из #{all}" + \
    #     "Предполагаемая оценка <br>" + \
    #     "<note> #{(5*(true_counter/all))} </note>").html_safe
    # end
end
