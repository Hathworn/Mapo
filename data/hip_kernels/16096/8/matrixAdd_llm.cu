```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixAdd(double *a, double *b, double *c, int cr, int cc){
    // Calculate the flat index for the 1D grid
    long idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x + threadIdx.y * cc + threadIdx.x;
    
    // Perform sum if within bounds
    if(idx < cr * cc){
        c[idx] = a[idx] + b[idx];
    }  
}