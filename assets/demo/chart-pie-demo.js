
   // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Con esto recupero el valor del span, no pude con jqury
    var ate = parseInt(document.getElementById("atendida").innerText);
    var noate = parseInt(document.getElementById("noAtendida").innerText);

    // Pie Chart Example        
    var dataset = [
        { label: "Atendidas", count: ate, color: "#28a745" },
        { label: "NO Atendidas", count: noate, color: "#FF0000" }
    ];

    var dataTotal = dataset.reduce((acc, data) => (acc += data.count), 0);

    var counter = document.getElementById("tituloGrafica");
    counter.innerHTML = `${dataTotal}<p class="sols">Solicitudes Totales</p>`;

    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [dataset[0].label, dataset[1].label],
            datasets: [{
                data: [dataset[0].count, dataset[1].count],
                backgroundColor: [dataset[0].color, dataset[1].color],
            }],
        },
        // Esto es para modificar las ocpiones del chart
        options: {
            // Tootltips es decir pasar el ratón encima del elemento
            tooltips: {
                // Lo que hace cada que se pasa el ratón
                callbacks: {
                    // En este caso me interesa los labels que se muestran, y esto obtiene el porcentaje, las var del data DEBEN ser números
                    label: function (tooltipItem, data) {
                        let allData = data.datasets[tooltipItem.datasetIndex].data;                 
                        let sumData = allData.reduce((memo, data) => (memo += data), 0);                        
                        let tooltipLabel = data.labels[tooltipItem.index];
                        let tooltipData = allData[tooltipItem.index];
                        let tooltipPercentageCalc = (tooltipData / sumData) * 100;
                        let tooltipPercentage = `${tooltipPercentageCalc.toFixed(1)}%`;

                        return `${tooltipLabel}: ${tooltipData} (${tooltipPercentage})`;
                    },         
                }
            },
            legend: {
                display: true,
                labels: {
                    usePointStyle: true,   
                    fontColor: "black",
                    fontSize: 15,

                    filter: function (legendItem, data) {
                        let labels = data.labels, datasets = data.datasets[0].data;
                        let total = ate + noate;

                        for (let i = 0; i < labels.length; i++) {
                            if (labels[i].indexOf(legendItem.text) != -1) {
                                let t = legendItem.text;
                                let p = parseFloat(datasets[i]) * 100 / total;
                                legendItem.text = t + ': ' + datasets[i] + " (" + p.toFixed(1) + "%)";
                                break;
                            }
                        }
                        return legendItem;
                    },
                },
                position: "bottom"
            }
        }
    });
