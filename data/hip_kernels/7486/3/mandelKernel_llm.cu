#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mandelKernel(double planoFactorXd, double planoFactorYd, double planoVxd, double planoVyd, int maxIteracionesd, unsigned int *coloresd, int img_width, int img_height, int num_processes, int my_pid) {
    int columna = blockIdx.x * blockDim.x + threadIdx.x;
    int fila = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check bounds to prevent unnecessary computations
    if (columna >= img_width || fila >= img_height) return;

    int real_row = (fila * num_processes) + my_pid;
    double X = (planoFactorXd * (double)columna) + planoVxd;
    double Y = (planoFactorYd * ((double)(img_height - 1) - (double)real_row)) + planoVyd;
    double pReal = 0.0;
    double pImag = 0.0;
    double distancia;
    int i = 0;

    // Simplified computation with fewer operations
    while (i < maxIteracionesd && (distancia = pReal * pReal + pImag * pImag) <= 4.0) {
        double pRealAnt = pReal;
        double pImagAnt = pImag;
        pReal = ((pRealAnt * pRealAnt) - (pImagAnt * pImagAnt)) + X;
        pImag = (2.0 * pRealAnt * pImagAnt) + Y;
        i++;
    }
    
    // Assign color value based on iteration count
    coloresd[(fila * img_width) + columna] = (i == maxIteracionesd) ? 0 : i;
}