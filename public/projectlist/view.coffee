define [
  '$'
  'view'
  'projectlist/template'
  'projectlist/template1'
  'react'
], ($, View, template, template1, React) ->
  
  class ReactView extends View
    template: (locals) ->
      console.log 'locals', locals
      x = new React.createClass {
        displayName: this.constructor.name
        getInitialState: -> return locals
        render: this.jsx
      }

      mountNode = document.createElement('div')
      console.log React.renderComponentToString(x(locals))
      @_react = React.renderComponent(x(locals), mountNode)
      console.log @_react
      return mountNode


  class ReactTest extends ReactView
    jsx: template1

    loaded: ->
      @locals = {secondsElapsed: 100}
      @locals.projects = @model.projects.models

    appeared: ->
      console.dir @_react
      # @ctr = 0      
      # window.setInterval =>
      #   @_react.setState {secondsElapsed: @ctr++}
      # , 1000
      


  
  class ProjectList extends View
    template: template

    loaded: ->
      @locals.projects = @model.projects.models

    render: ->
      @append '.js-test', new ReactTest {model: @model}

  return ProjectList


