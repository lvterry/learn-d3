dataset = [
        [
                { x: 0, y: 5 },
                { x: 1, y: 4 },
                { x: 2, y: 2 },
                { x: 3, y: 7 },
                { x: 4, y: 23 }
        ],
        [
                { x: 0, y: 10 },
                { x: 1, y: 12 },
                { x: 2, y: 19 },
                { x: 3, y: 23 },
                { x: 4, y: 17 }
        ],
        [
                { x: 0, y: 22 },
                { x: 1, y: 28 },
                { x: 2, y: 32 },
                { x: 3, y: 35 },
                { x: 4, y: 43 }
        ]
]
stack = d3.layout.stack()
stack(dataset)

w = 600
h = 400
color = d3.scale.category10()

yMax = d3.max dataset, (arr) ->
  d3.max arr, (item) -> item.y + item.y0

x = d3.scale.ordinal().domain(d3.range(dataset[0].length)).rangeRoundBands([0, w], 0.1)
y = d3.scale.linear().domain([0, yMax]).range([0, h])

svg = d3.select('body').append('svg').attr('w', w).attr('h', h)

groups = svg.selectAll('g')
  .data(dataset)
  .enter()
  .append('g')
  .attr('fill', (d, i) -> color(i))

groups.selectAll('rect')
  .data((d) -> d)
  .enter()
  .append('rect')
  .attr
    'x': (d, i) -> x(i)
    'y': (d) -> h - y(d.y + d.y0)
    'width': x.rangeBand()
    'height': (d) -> y(d.y)