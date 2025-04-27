#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mandelKernel(double planoFactorXd, double planoFactorYd, double planoVxd, double planoVyd, int maxIteracionesd, unsigned int *coloresd, int img_width, int img_height, int num_processes, int my_pid, int rw) {

    // Determine pixel
    int columna = blockIdx.x * blockDim.x + threadIdx.x;
    int fila = (rw * MAX_ROWS_PER_KERNEL) + blockIdx.y * blockDim.y + threadIdx.y;
    int real_row = fila * num_processes + my_pid;

    if(real_row >= img_height)
        return;

    // Pre-compute often used values
    double fila_factor = planoFactorYd * ((double)(img_height - 1) - (double)real_row) + planoVyd;
    double columna_factor = planoFactorXd * (double)columna + planoVxd;

    // Real pixel coords
    double X = columna_factor;
    double Y = fila_factor;

    double pReal = 0.0, pImag = 0.0, pRealAnt, pImagAnt;
    double distancia;
    int i = 0;

    // Use a single loop instead of do-while
    for (i = 0; i < maxIteracionesd; ++i) {
        pRealAnt = pReal;
        pImagAnt = pImag;
        pReal = (pRealAnt * pRealAnt) - (pImagAnt * pImagAnt) + X;
        pImag = 2.0 * pRealAnt * pImagAnt + Y;
        distancia = pReal * pReal + pImag * pImag;
        if (distancia > 4.0) // Break early if condition is met
            break;
    }

    // Assign color value directly
    coloresd[fila * img_width + columna] = (i == maxIteracionesd) ? 0 : i; 
}