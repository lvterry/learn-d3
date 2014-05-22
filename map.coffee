w = 800
h = 600

svg = d3.select('body').append('svg').attr('width', w).attr('height', h)

projection = d3.geo.albersUsa().translate [w/2, h/2]

path = d3.geo.path().projection projection

color = d3.scale.quantize().range(["rgb(237,248,233)", "rgb(186,228,179)", "rgb(116,196,118)", "rgb(49,163,84)","rgb(0,109,44)"])

d3.json 'us_states.json', (json) ->
  svg.selectAll('path')
    .data(json.features)
    .enter()
    .append('path')
    .attr('d', path)