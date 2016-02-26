$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            进馆人数: 2647
        }, {
            period: '2010 Q2',
            进馆人数: 2441
        }, {
            period: '2010 Q3',
            进馆人数: 2501
        }, {
            period: '2010 Q4',
            进馆人数: 5689
        }, {
            period: '2011 Q1',
            进馆人数: 2293
        }, {
            period: '2011 Q2',
            进馆人数: 1881
        }, {
            period: '2011 Q3',
            进馆人数: 1588
        }, {
            period: '2011 Q4',
            进馆人数: 5175
        }, {
            period: '2012 Q1',
            进馆人数: 2028
        }, {
            period: '2012 Q2',
            进馆人数: 1791
        }],
        xkey: 'period',
        ykeys: ['进馆人数'],
        labels: [ '进馆人数'],
        pointSize: 3,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });
    
});
