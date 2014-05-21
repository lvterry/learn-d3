dataset = {
  nodes: [
    { name: "Adam" },
    { name: "Bob" },
    { name: "Carrie" },
    { name: "Donovan" },
    { name: "Edward" },
    { name: "Felicity" },
    { name: "George" },
    { name: "Hannah" },
    { name: "Iris" },
    { name: "Jerry" }
  ],
  edges: [
    { source: 0, target: 1 },
    { source: 0, target: 2 },
    { source: 0, target: 3 },
    { source: 0, target: 4 },
    { source: 1, target: 5 },
    { source: 2, target: 5 },
    { source: 2, target: 5 },
    { source: 3, target: 4 },
    { source: 5, target: 8 },
    { source: 5, target: 9 },
    { source: 6, target: 7 },
    { source: 7, target: 8 },
    { source: 8, target: 9 }
  ]
}

w = 600
h = 400
color = d3.scale.category10()

force = d3.layout.force()
  .nodes(dataset.nodes)
  .links(dataset.edges)
  .size([w, h])
  .linkDistance([200])
  .charge([-100])
  .start()

console.log dataset

svg = d3.select('body').append('svg').attr('width', w).attr('height', h)

edges = svg.selectAll('line')
  .data(dataset.edges)
  .enter()
  .append('line')
  .attr('stroke', '#ccc')
  .attr('stroke-width', 1)

circles = svg.selectAll('circle')
  .data(dataset.nodes)
  .enter()
  .append('circle')
  .attr('r', 10)
  .attr('fill', (d,i) -> color(i))
  .call(force.drag)

force.on 'tick', ->
  edges.attr('x1', (d) -> d.source.x)
    .attr('y1', (d) -> d.source.y)
    .attr('x2', (d) -> d.target.x)
    .attr('y2', (d) -> d.target.y)

  circles.attr('cx', (d) -> d.x)
    .attr('cy', (d) -> d.y)








