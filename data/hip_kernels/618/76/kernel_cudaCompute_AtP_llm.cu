#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaCompute_AtP(double *d_A, double *d_P, double *d_AtP, int rows, int columns) {
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access to frequently used data
    __shared__ double shared_P[256]; // Adjust size based on blockDim.x

    if (threadIdx.x < columns) {
        shared_P[threadIdx.x] = d_P[threadIdx.x];
    }
    __syncthreads();

    if (ind < rows * columns) {
        int row = ind % rows;
        int column = ind / rows;

        // Access shared memory for P to reduce global memory access latency
        d_AtP[row + column * rows] = d_A[column + row * columns] * shared_P[column];
    }
}