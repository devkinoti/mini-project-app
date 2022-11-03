import { Controller } from "@hotwired/stimulus"

import "../vendors/echarts"

// Connects to data-controller="dashboard-project-chart"
export default class extends Controller {

  static targets = ["dashboardProjects"]
  static values = { month: Array, projects: Array}


  connect() {
    console.log(this.dashboardProjectsTarget)


    // dashboard line chart
    var dashboardLineChart = echarts.init(this.dashboardProjectsTarget);

    var line_chart_option = {
      tooltip: {
        trigger: "axis",
        padding: [7,10],
        borderWidth: 1,
        transitionDuration: 0,
      },
      xAxis: {
        type: "category",
        data: this.monthValue,
        boundaryGap: false,
        axisPointer: {
          lineStyle: {
            color: "#2c7be5",
            type: "dashed"
          }
        },
        splitLine: {
          show: false
        },
        axisLine: {
          lineStyle: {
            color: "#000",
            type: "dashed"
          }
        },
        axisTick: {
          show: false
        },
        axisLabel: {
          margin: 15
        }
        //boundaryGap: false,
      },
      yAxis: {
        type: "value",
        axisPointer: {
          show: false
        },
        splitLine: {
          lineStyle: {
            type: "dashed"
          }
        },
        boundaryGap: false,
        axisLabel: {
          show: true,
          margin: 15
        },
        axisTick: {
          show: false
        },
        axisLine: {
          show: false
        }
      },
      series: [
        {
          data: this.projectsValue,
          type: "line",
          lineStyle: {
            color: "#2c7be5",
            
          },
          itemStyle: {
            borderColor: "#2c7be5",
            borderWidth: 2
          },
          symbol: "emptyCircle",
          symbolSize: 10,
          smooth: false,
          hoverAnimation: true,
          areaStyle: {
            color: {
              type: "linear",
              x: 0,
              y: 0,
              x2: 0,
              y2: 1,
              colorStops: [{
                offset: 0,
                color: "#2c7be5",
              }, {
                offset: 1,
                color: "#2c7be5",
              }]
            }
          }
        }
      ],
      grid: {
        right: "28px",
        left: "40px",
        bottom: "15%",
        top: "5%"
      }
    }

    dashboardLineChart.setOption(line_chart_option)
  
  }
}
