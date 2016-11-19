class TrainersController < ApplicationController
    def index
        @trainers = Trainer.all
    end
    # Checks user answer with true answer.
    #!TODO Fix this! It isnt nice code!
    def check
        @trainer = Trainer.find(params[:id])
        temp = session[@trainer.id.to_s + "ans"]
        temp['user_ans'] = params[:user_ans].to_f
        @generated_task = temp
    end

    # Shows random task from this trainer
    def show
        @trainer = Trainer.find(params[:id])
        task = @trainer.task.sample
        variables = json_decode(task.variables)
        random_variables = {}
        variables.each{ |el,var| random_variables[el] = var.sample }

        @generated_task = GeneratedTask.new(:text => (task.template % random_variables), :true_ans => (eval(task.formula % random_variables)).to_f)
        session[@trainer.id.to_s + "ans"] = @generated_task
    end

    private

        def json_decode(string)
            JSON.parse(string,:symbolize_names => true)
        end

        def json_encode(object)
            object.to_json
        end
end
