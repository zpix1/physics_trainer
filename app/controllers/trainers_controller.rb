class TrainersController < ApplicationController
    def index
        @trainers = Trainer.all
    end
    # Checks user answer with true answer.
    #!TODO Fix this! It isnt nice code!
    def check
        @trainer = Trainer.find(params[:id])
        temp = session[@trainer.id.to_s + "_trainer"]
        temp[:user_ans] = params[:user_ans].to_f
        @generated_task = temp
    end

    # Shows random task from this trainer
    def show
        @trainer = Trainer.find(params[:id])
        @generated_task = get_task @trainer
        session[@trainer.id.to_s + "_trainer"] = @generated_task
    end

    def mix_show
        @trainers = Trainer.all
        @generated_tasks = @trainers.map{|t| get_task t}
        session["mix"] = @generated_tasks
    end

    def mix_check
        temp = session["mix"]
        temp.each_with_index{|task,i| task[:user_ans] = params['mix_'+i.to_s].to_f}
        @generated_tasks = temp
    end

    def exam_show
        @trainer = Trainer.find(params[:id])
        @generated_tasks = get_all_tasks @trainer
        session["exam"] = @generated_tasks
    end

    def exam_check
        temp = session["exam"]
        temp.each_with_index{|task,i| task[:user_ans] = params['exam_'+i.to_s].to_f}
        @generated_tasks = temp
    end

    private
        def get_task(trainer)
            task = trainer.task.sample
            variables = json_decode(task.variables)
            random_variables = {}
            variables.each{ |el,var| random_variables[el] = var.sample }
            {:text => (task.template % random_variables), :true_ans => (eval(task.formula % random_variables)).to_f}
        end

        def get_all_tasks(trainer)
            tasks = trainer.task.all
            generated_tasks = []
            tasks.each do |task|
                variables = json_decode(task.variables)
                random_variables = {}
                variables.each { |el,var| random_variables[el] = var.sample }
                generated_tasks.push ({ text: (task.template % random_variables), true_ans: (eval(task.formula % random_variables)).to_f})
            end
            generated_tasks
        end

        def json_decode(string)
            JSON.parse(string,:symbolize_names => true)
        end

        def json_encode(object)
            object.to_json
        end
end
