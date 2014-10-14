define [
  '$'
  'backbone'
], ($, {Model, Collection}) ->
  
  # class Client extends Model

  # class Clients extends Collection
  #   model: Client
  #   url: 'http://rest.zk.io/pixedittest1/clients/'

  class Client extends Model
    urlRoot: 'http://rest.zk.io/pixedittest1/clients/'

    loadProjects: ->
      @projects = new Projects
      @projects.clientID = @id
      @projects.fetch()


  class Project extends Model
  
  class Projects extends Collection
    model: Project
    url: -> "http://rest.zk.io/pixedittest1/clients/#{@clientID}/projects/"



  {Client}
