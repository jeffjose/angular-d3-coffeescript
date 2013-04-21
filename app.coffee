'use strict'

angular.module('hprgApp', [])

.controller('HPRGCtrl', ['$scope'

  ($scope) ->

    $scope.data = {
        'TTP': 'lonar.ddu-india.com'
        'GDI': 'roganjosh..ddu-india.com'
        'GLD': 'sitar.anim.dreamworks.com'
        'PDI': 'florida.pdi.com'
    }

    

])

.directive('viz', [ ->

    return {

        restrict: 'E'
        scope: {site: '='}
        link: (scope, element, attrs) ->
            
            setupViz(scope, element, attrs)

            scope.$watch('site', updateCircle, true)

            element.bind('mouseenter', (event) ->
                console.log('enter')
                scope.svg.selectAll('rect')
                .transition()
                .style('fill', 'green')
                .attr('height', 80)
                .attr('width', 80)
            )

            element.bind('mouseleave', (event) ->
                scope.svg.selectAll('rect')
                .transition()
                .style('fill', 'steelblue')
                .attr('height', 50)
                .attr('width', 50)
            )
    }
])


setupViz = (scope, element, attrs) ->

    console.log('CREATE SVG!')
    console.log(scope, element, attrs.site)

    if not scope.svg?
        scope.svg = d3.select(element[0]).append('svg')
        .attr('width', 200)
        .attr('height', 200)

    console.log(scope.svg)

    scope.svg.selectAll('rect').data([1,2,3]).enter()
    .append('rect')
    .attr('x', 50)
    .attr('y', 50)
    .attr('width', 50)
    .attr('height', 50)
    .style('fill', 'steelblue')
    .transition()

updateCircle = (oldVal, newVal, scope)->

    console.log('UPDATE CIRLCE!')
    console.log(oldVal, newVal, scope)
