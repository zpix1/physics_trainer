class TrainersController < ApplicationController
    def index
        @trainers = Trainer.all
    end

    def show
        @trainer = Trainer.find(params[:id])
        task = @trainer.task.sample
        variables = json_decode(task.variables)
        random_variables = {}
        variables.each{ |el,var| random_variables[el] = var.sample }
        @task_text = task.template % random_variables
        @answer = eval(task.formula % random_variables)
    end

    private

        def json_decode(string)
            JSON.parse(string,:symbolize_names => true)
        end

        def json_encode(object)
            object.to_json
        end
end
