define [
  '$'
  'view'
  'application'
  'main_layout'
  'projectlist/view'
], ($, View, Application, mainLayoutT, ProjectListView) ->
  
  class PixeditApp extends Application
    title: "Pixel Editor"
    template: mainLayoutT
    init: ->
    load: ->
      # Check local storage for a client key.
      # If no client key create a new one
      # Load user's projects.
      # ? Open first project? Last accessed project?



    render: ->
      @append '.left-bar', new ProjectListView

    appear: ->
      # This line doesn't seem to work, possibly because link elements don't
      # actually load till they're on the main dom?
      # @waitOn new Promise (resolve, reject) => @$('.js-css1').on 'load', resolve
        

    appeared: ->



  new PixeditApp


