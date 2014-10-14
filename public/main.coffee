define [
  '$'
  'view'
  'application'
  'main_layout'
  'client_model'  
  'projectlist/view'

], ($, View, Application, mainLayoutT, {Client}, ProjectListView) ->
  
  class PixeditApp extends Application
    title: "Pixel Editor"
    template: mainLayoutT
    init: ->
    load: -> 
      @once 'load', @loadClient

    loadClient: ->      
      @client = new Client
      window.client = @client

      # Check local storage for a client key.
      key = localStorage.getItem 'client key'      

      # Fetch the client from the server
      if key?
        console.log 'Loading existing user'
        @waitOn new Promise (resolve, reject) =>
          @client.id = key
          @client.fetch().done resolve

      else # If no client key create a new one
        console.log 'creating new user'
        @waitOn new Promise (resolve, reject) =>
          @client.save().done =>
            console.log 'saving new key'
            localStorage.setItem 'client key', @client.id
            resolve()

      # Once we have our client, load the projects.
      @once 'load', @loadProjects

    loadProjects: ->
      # Load user's projects.
      # ? Open first project? Last accessed project?
      console.log "loading projects for user #{@client.id}"
      @waitOn new Promise (resolve, reject) => @client.loadProjects().done resolve
      




    render: ->
      @append '.left-bar', new ProjectListView {model: @client}

    appear: ->
      # This line doesn't seem to work, possibly because link elements don't
      # actually load till they're on the main dom?
      # @waitOn new Promise (resolve, reject) => @$('.js-css1').on 'load', resolve
        

    appeared: ->



  new PixeditApp


