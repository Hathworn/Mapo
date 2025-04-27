#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Optimize by reducing nested conditions into a single if statement
    if (x < nn && y < nn && x != i && y == i) {
        A[x * nn + y] = 0;
    }
}