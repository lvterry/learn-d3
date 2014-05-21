data = []

for num in [1..300]
  temp = [num, Math.random() * 30]
  data.push temp

w = 1000
h = 80

svg = d3.select('body').append('svg').attr('width', w).attr('height', h)

x = d3.scale.linear().range([0, w]).domain(d3.extent(data, (d) -> d[0]))
y = d3.scale.linear().range([20, h]).domain(d3.extent(data, (d) -> d[1]))

#svg.select('path')

line = d3.svg.line()
  .x((d) -> x(d[0]))
  .y((d) -> h - y(d[1]))


area = d3.svg.area()
  .x((d) -> x(d[0]))
  .y0(h)
  .y1((d) -> h - y(d[1]))

svg.append('path').attr('class', 'line').attr 'd', line(data)
svg.append('path').attr('class', 'area').attr 'd', area(data)