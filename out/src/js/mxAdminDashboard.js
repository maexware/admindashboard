/**
 * Created by ababerowski on 02.02.17.
 */

$(function mwAdminDashboard() {

    var data        = [],
        yearData    = [],
        totalPoints = parseInt($('#mwHorizonOrders').val()),
        maxValues   = parseInt($('#mwHorizonOrders_maxCount').val());


    function getYearChartData() {
        $( ".yearDevelopment" ).each( function( index, el ) {
            yearData.push([$(el).data('year'),$(el).val()]);
        });
        console.log(yearData);
        return yearData;
    }

    function getChartData() {

        if (data.length > 1)
            data = data.slice(1);
        while (data.length < totalPoints) {
            if ($('#mwHorizonOrders_point-'+data.length).length) {
                value = parseInt($('#mwHorizonOrders_point-'+data.length).val());
            } else {
                value = 0;
            }
            y = value;
            data.push(y);
        }

        // Zip the generated y values with the x values
        var res = [];
        for (var i = 1; i < data.length; ++i) {
            res.push([i, data[i]]);
        }

        return res;
    }

    $('#mwToggleSidebar').click(function(){
        colValues = window.parent.document.getElementById("mwTopFrame").getAttribute("cols");
        // = "20%, 80%"
        if (colValues == '5, *') {
            window.parent.document.getElementById("mwTopFrame").cols = "200, *";
        } else {
            window.parent.document.getElementById("mwTopFrame").cols = "5, *";
        }
    });

    if ($('#yearChart').length > 0) {
        yearTicks   = $('.yearDevelopment').length;
        yearMax     = $('#yearMaxVal').val();
        var yearChart_plot = $.plot("#yearDevelopment", [getYearChartData()], {
            grid: {
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0, // Drawing is faster without shadows
                color: "#3c8dbc"
            },
            lines: {
                fill: true, //Converts the line chart to area chart
                color: "#3c8dbc"
            },
            yaxis: {
                min: 0,
                max: yearMax,
                show: true,
                ticks: yearTicks,
                tickDecimals: 0
            },
            xaxis: {
                show: true,
                ticks: yearTicks,
                tickDecimals: 0
            }
        });
        yearChart_plot.draw();
    }

    if ($('#orderChart').length > 0) {
        var orderoverview_plot = $.plot("#orderoverview", [getChartData()], {
            grid: {
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0, // Drawing is faster without shadows
                color: "#3c8dbc"
            },
            lines: {
                fill: true, //Converts the line chart to area chart
                color: "#3c8dbc"
            },
            yaxis: {
                min: 0,
                max: maxValues,
                show: true,
                ticks: totalPoints,
                tickDecimals: 0
            },
            xaxis: {
                show: true,
                ticks: totalPoints,
                tickDecimals: 0
            }
        });

        $('#orderoverviewType .btn').click(function() {
            $('.loader').show();
            actOption = $(this).attr('data-option');
            $('#orderoverviewType .btn').removeClass('active');
            $('#orderChart #orderChartOption').val(actOption);

            $(this).addClass('active');
        });

        $('#orderoverviewNavigation .btn').click(function(e) {
            $('.loader').show();
            e.preventDefault();
            actOption       = $('#orderChartOption').val();
            actOptionYear   = $('#mwHorizonOrders_optionYear').val();
            actOptionMonth  = $('#mwHorizonOrders_optionMonth').val();
            goto            = $(this).attr('data-option');

            if (actOption == 'm') {
                sAdditionalParams = '&actMonth='+actOptionMonth+'&actYear='+actOptionYear;
            } else if (actOption == 'y') {
                actOptionVal = $('#mwHorizonOrders_optionMonth').val();
                sAdditionalParams = '&actYear='+actOptionYear;
            } else {
                sAdditionalParams = '';
            }
            $.ajax({
                url: 'index.php',
                data: $('#orderChart').serialize()+'&nav='+goto+sAdditionalParams,
                processData: false,
                type: 'POST',
                success: function ( data ) {
                    $('#orderoverviweData').html(data);
                    updateOrderChart();
                    $('.loader').hide();
                }
            });

        });

        $( '#orderChart' ).submit(function ( e ) {
            actOption       = $('#orderChartOption').val();
            actOptionYear   = $('#mwHorizonOrders_optionYear').val();
            actOptionMonth  = $('#mwHorizonOrders_optionMonth').val();
            if (actOption == 'm') {
                sAdditionalParams = '&actMonth='+actOptionMonth+'&actYear='+actOptionYear;
            } else if (actOption == 'y') {
                sAdditionalParams = '&actYear='+actOptionYear;
            } else {
                sAdditionalParams = '';
            }
            sendAjaxOrderRequest(sAdditionalParams,actOptionYear);

            e.preventDefault();
        });

        //LOAD ORDER CHART
        actOption       = $('#orderChartOption').val();
        actOptionYear   = $('#mwHorizonOrders_optionYear').val();
        actOptionMonth  = $('#mwHorizonOrders_optionMonth').val();

        if (actOption == 'm') {
            sAdditionalParams = '&actMonth='+actOptionMonth;
        } else if (actOption == 'y') {
            sAdditionalParams = '&actYear='+actOptionYear;
        } else {
            sAdditionalParams = '';
        }
        sendAjaxOrderRequest(sAdditionalParams,actOptionYear);
    }

    function sendAjaxOrderRequest(sAdditionalParams,actOptionYear) {
        $.ajax({
            url: 'index.php',
            data: $('#orderChart').serialize()+'&'+sAdditionalParams+'&year='+actOptionYear,
            processData: false,
            type: 'POST',
            success: function ( data ) {
                $('#orderoverviweData').html(data);
                updateOrderChart();
                $('.loader').hide();
            }
        });
    }

    function updateOrderChart() {
        data = [];
        totalPoints   = parseInt($('#mwHorizonOrders').val());
        maxValues     = parseInt($('#mwHorizonOrders_maxCount').val());
        option        = $('#mwHorizonOrders_option').val();
        optionTitle   = $('#mwHorizonOrders_optionMonth').val();
        optionYear    = $('#mwHorizonOrders_optionYear').val();

        if (option == 'm' || option == 'cm') {
            var date = new Date(optionTitle+"/01/"+optionYear),
                locale = "en-us",
                optionTitle = date.toLocaleString(locale, { month: "long" });
            sChartTitle = optionTitle+' '+optionYear;
            totalPoints++;
        } else if(option == 'y' || option == 'cy') {
            sChartTitle = optionYear;
        }

        $('#orderChartPeriod').html(sChartTitle);

        var orderoverview_plot = $.plot("#orderoverview", [getChartData()], {
            grid: {
                borderColor: "#f3f3f3",
                borderWidth: 1,
                tickColor: "#f3f3f3"
            },
            series: {
                shadowSize: 0, // Drawing is faster without shadows
                color: "#3c8dbc",
                points: {
                    show: true
                },
                lines: {
                    show: true,
                    lineWidth: 2
                }

            },
            lines: {
                fill: true, //Converts the line chart to area chart
                color: "#3c8dbc"
            },
            yaxis: {
                min: 0,
                max: maxValues,
                show: true,
                ticks: totalPoints,
                tickDecimals: 0
            },
            xaxis: {
                show: true,
                ticks: totalPoints,
                tickDecimals: 0
            }
        });

        orderoverview_plot.draw();
    }

    /*
     * DONUT CHART
     * -----------
     */

    var orderChartPayment = [];
    $( ".paymentsCharItem" ).each(function( index ) {
        nameOCP = $(this).val();
        valueOCP = $(this).attr('id');
        valueOCP = valueOCP.replace(/\D/g,'');
        valueOCP = parseInt(valueOCP);
        colorcode = '#'+Math.floor(Math.random()*16777215).toString(16);
        tmpData = {label:nameOCP, data: valueOCP};
        orderChartPayment.push(tmpData);

    });

    $.plot("#orderChartPayment", orderChartPayment, {
        series: {
            pie: {
                show: true,
                radius: 1,
                innerRadius: 0.5,
                label: {
                    show: true,
                    radius: 2 / 3,
                    formatter: labelFormatter,
                    threshold: 0.1
                }

            }
        },
        legend: {
            show: true
        }
    });

    stornocount = $('#aQualityOrdersStorno').val();
    nostornocount = $('#aQualityOrdersNostorno').val();
    var aQualityOrdersStorno = [{label:'Storniert',data:stornocount,color: "red"},{label:'Normal',data:nostornocount,color: "green"}];
    $.plot("#orderChartQuality", aQualityOrdersStorno, {
        series: {
            pie: {
                show: true,
                radius: 1,
                innerRadius: 0.5,
                label: {
                    show: true,
                    radius: 2 / 3,
                    formatter: labelFormatter,
                    threshold: 0.1
                }

            }
        },
        legend: {
            show: true
        }
    });

    orderfolderstatenew = $('#orderFolderStateNew').val();
    orderfolderstateproblem = $('#orderFolderStateProblem').val();
    orderfolderstatefinnished = $('#orderFolderStateFinnished').val();

    var orderFolders = [
        {label:'Neu',data:orderfolderstatenew, color: "orange"},
        {label:'Probleme',data:orderfolderstateproblem, color: "red"},
        {label:'Bearbeitet',data:orderfolderstatefinnished, color: "green"}
    ];
    $.plot("#orderFolderStates", orderFolders, {
        series: {
            pie: {
                show: true,
                radius: 1,
                innerRadius: 0.5,
                label: {
                    show: true,
                    radius: 2 / 3,
                    formatter: labelFormatter,
                    threshold: 0.1
                }

            }
        },
        legend: {
            show: true
        }
    });

    /*
     * END DONUT CHART
     */

    /*
     * BAR CHART
     * ---------
     */
    var tmpCats = [];

    $( ".topSellerCategoy" ).each(function() {
        tmpCats.push(
            [$(this).val(),$(this).attr('data-option')]
        );
    });

    var orderChartCategory = {
        data: tmpCats,
        color: "#3c8dbc"
    };
    $.plot("#orderChartCategory", [orderChartCategory], {
        grid: {
            borderWidth: 1,
            borderColor: "#f3f3f3",
            tickColor: "#f3f3f3"
        },
        series: {
            bars: {
                show: true,
                barWidth: 0.5,
                align: "center"
            }
        },
        xaxis: {
            mode: "categories",
            tickLength: 0
        }
    });



    usersHasAccount = $('#userAccountVal').val()
    usersHasNoAccount = $('#userNoAccountVal').val()
    usersHasAdmin = $('#userAminVal').val()

    var userChart = {
        data: [["Mit Konto", usersHasAccount], ["Ohne Konto", usersHasNoAccount], ["Admin", usersHasAdmin]],
        color: "#3c8dbc"
    };
    $.plot("#userChart", [userChart], {
        grid: {
            borderWidth: 1,
            borderColor: "#f3f3f3",
            tickColor: "#f3f3f3"
        },
        series: {
            bars: {
                show: true,
                barWidth: 0.5,
                align: "center"
            }
        },
        xaxis: {
            mode: "categories",
            tickLength: 0
        }
    });

    usersAccounts = $('#userNewsletteraccountsVal').val()
    usersAccountsOptin = $('#userNewsletteroptinVal').val()
    usersAccountsOptinConfirmed = $('#userNewsletteroptinconfirmesVal').val()

    var userNewsletterChart = [
        {label:'Kunden',data:usersAccounts, color: "yellow"},
        {label:'Newsletter angemeldet',data:usersAccountsOptinConfirmed, color: "green"},
        {label:'Newsletter nicht bestätigt',data:usersAccountsOptin, color: "red"}
    ];

    $.plot("#userNewsletterChart", userNewsletterChart, {
        series: {
            pie: {
                show: true,
                radius: 1,
                innerRadius: 0.5,
                label: {
                    show: true,
                    radius: 2 / 3,
                    formatter: labelFormatter,
                    threshold: 0.1
                }

            }
        },
        legend: {
            show: true
        }
    });

    userCounter         = $('#userCounter').val();
    userBoughtCounter   = $('#userBoughtCounter').val();
    guestCounter        = $('#guestCounter').val();
    guestBoughtCounter  = $('#guestBoughtCounter').val();

    var userBoughtData = {
        data: [
            ["Kunden vs. Bestellungen", userCounter],
            ["Kunden vs. Bestellungen", userBoughtCounter],
            ["Gäste vs. Bestellungen", guestCounter],
            ["Gäste vs. Bestellungen", guestBoughtCounter]
        ]
    };
    $.plot("#userBought", [userBoughtData], {
        grid: {
            borderWidth: 1,
            borderColor: "#f3f3f3",
            tickColor: "#f3f3f3"
        },
        series: {
            bars: {
                show: true,
                barWidth: 0.5,
                align: "center"
            }
        },
        xaxis: {
            mode: "categories",
            tickLength: 0
        }
    });

    /*
     * Custom Label formatter
     * ----------------------
     */
    function labelFormatter(label, series) {
        return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
            + label
            + "<br>"
            + Math.round(series.percent) + "%</div>";
    }

});

function updateOrderChartIncome(incomeBrut,incomeNet) {
    $('#incomeBrut').html(incomeBrut);
    $('#incomeNet').html(incomeNet);
}
