<div>
  <div>Seconds Elapsed: {this.state.secondsElapsed}</div>

  <h3>your projects</h3>
  <select size="10">
    {this.state.projects.map(function(project){
      return <option>{project.get('name') || ""}</option>
    })}
  </select>

  <button>create new</button>
  <input type="text" placeholder="hide till that button is pressed"></input>
</div>