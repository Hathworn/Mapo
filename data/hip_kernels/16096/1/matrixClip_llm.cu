#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixClip(double *a, double min, double max, double *c, int cr, int cc){

    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if(x < cc && y < cr){
        // Use min and max functions for concise conditional logic
        double value = a[y * cc + x];
        value = fmax(min, fmin(max, value));
        c[y * cc + x] = value;
    }

}