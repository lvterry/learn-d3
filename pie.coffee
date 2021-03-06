w = 400
h = 400
innerRadius = w / 4
outerRadius = w / 2
arc = d3.svg.arc().innerRadius(innerRadius).outerRadius(outerRadius)
pie = d3.layout.pie()
data = [ 5, 10, 20, 45, 6, 25 ]
color = d3.scale.category10()

svg = d3.select('body').append('svg').attr('width', w).attr('height', h)

arcs = svg.selectAll('g.arc')
  .data(pie(data))
  .enter()
    .append('g')
    .attr('class', 'arc')
    .attr('transform', "translate(#{outerRadius},#{outerRadius})")

arcs.append('path')
  .attr('d', arc)
  .attr('fill', (d, i) -> color(i))

arcs.append('text')
  .attr('text-anchor', 'middle')
  .text((d) -> d.value)
  .attr('transform', (d) -> "translate(#{arc.centroid(d)})")