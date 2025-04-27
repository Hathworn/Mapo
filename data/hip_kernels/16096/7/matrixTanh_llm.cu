#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTanh(double *a, double *c, int cr, int cc){

    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if(x < cc && y < cr){
        // Use shared memory to reduce global memory access
        extern __shared__ double shared_a[];
        int index = y * cc + x;
        shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[index];
        __syncthreads();

        // Compute tanh using shared memory
        c[index] = tanh(shared_a[threadIdx.y * blockDim.x + threadIdx.x]);
    }
}