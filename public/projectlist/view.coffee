define [
  '$'
  'view'
  'projectlist/template'
], ($, View, template) ->
  
  class ProjectList extends View
    template: template


  return ProjectList


