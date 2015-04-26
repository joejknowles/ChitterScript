class ChitterScript < Sinatra::Base
  post '/smile'  do
    cheep = Cheep.first(id: params[:cheep_id])
    smile = Smile.first(
      cheep: cheep,
      user: current_user)
    if smile
      smile.destroy
    else
      Smile.create(
        cheep: cheep,
        user: current_user)
    end
    if request.xhr?
      cheep.smiles.length.to_s
    else
      redirect to '/'
    end
  end
end