<%--
  Created by IntelliJ IDEA.
  User: cuhp
  Date: 28/09/2019
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script>
        $(document).ready( function () {
            var dataDiagram;
            var myChart;
            var circleChart;
            $('#submit').on('click', function () {
                if(myChart) {
                    myChart.destroy();
                }
                if(circleChart) {
                    circleChart.destroy();
                }
                // myChart.destroy();
                dataDiagram = null;
                var urlAttr = $('#data').val();
                $.get("get-resource?url="+urlAttr, function(data, status){
                    dataDiagram = data;
                    showDiagram(dataDiagram);
                });


            })
            $('#clear').on('click', function () {
                $('#data').val('');
                $('#myChart').hide();
                $('#circleMyChart').hide();
                dataDiagram = null;

            })
            $('#column').on('click', function () {
                showDiagram(dataDiagram);
            })
            $('#circle').on('click', function () {
                showDiagram(dataDiagram);
            })

            function showDiagram(dataDiagram) {

                var ctx = document.getElementById('myChart').getContext('2d');
                if(dataDiagram && $("#column").is(":checked")) {
                    $('#circleMyChart').hide();
                    var labelData = dataDiagram.map(s => s.componentName);
                    var ratio = dataDiagram.map(s=>s.ratio);
                    myChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: labelData,
                            datasets: [{
                                label: dataDiagram.length+' of Component',
                                data: ratio,
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(54, 162, 235, 0.2)',
                                    'rgba(255, 206, 86, 0.2)',
                                    'rgba(75, 192, 192, 0.2)',
                                    'rgba(153, 102, 255, 0.2)',
                                    'rgba(255, 159, 64, 0.2)',
                                    'rgba(125, 159, 64, 0.2)'

                                ],
                                borderColor: [
                                    'rgba(255, 99, 132, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(54, 162, 235, 1)',
                                    'rgba(255, 206, 86, 1)',
                                    'rgba(75, 192, 192, 1)',
                                    'rgba(153, 102, 255, 1)',
                                    'rgba(255, 159, 64, 1)',
                                    'rgba(111, 159, 64, 1)'
                                ],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }]
                            }
                        }
                    });
                    $('#myChart').show();

                }
                else if(dataDiagram && $("#circle").is(":checked")) {
                    $('#myChart').hide();
                    circleChart = new Chart(document.getElementById("circleMyChart"), {
                        type: 'pie',
                        data: {
                            labels: dataDiagram.map(s=>s.componentName),
                            datasets: [{
                                backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#d45850","#e45850", "#f45850","#f15850","#j45850"],
                                data: dataDiagram.map(s=>s.ratio)
                            }]
                        },
                        options: {
                            title: {
                                display: true,
                                text: 'Analyze quality security of '+ $('#data').val()
                            }
                        }
                    });
                    $('#circleMyChart').show();
                }
            }
        });


    </script>
</head>
<body>
    <div class="container">
        <h2>This is the admin page</h2>
        <form method="get" action="#" class="col-md-12">
            <div class="col-md-3">
                <input class="form-control" placeholder="URL" type="text" id="data">
            </div>
            <div class="col-md-1">
                <button type="submit" class="btn btn-success" id="submit"> Submit</button>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-danger" id="clear"> Clear</button>
            </div>
        </form>
        <div class="col-md-12">
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="column" name="customRadioInline1" checked="checked" class="custom-control-input">
                <label class="custom-control-label" for="column">Column</label>
            </div>
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="circle" name="customRadioInline1" class="custom-control-input">
                <label class="custom-control-label" for="circle">Circle</label>
            </div>
        </div>
        <div class="col-md-6">
            <canvas id="myChart"></canvas>
        </div>
        <div class="clearfix"></div>
        <div class="col-md-6">
            <canvas id="circleMyChart"></canvas>
        </div>
    </div>
</body>
</html>
