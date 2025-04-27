#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixExp(double *a, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    // Use shared memory to store data temporarily for faster access
    extern __shared__ double shared_a[];

    if (x < cc && y < cr) {
        // Load data into shared memory
        int index = y * cc + x;
        shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[index];
        __syncthreads();

        // Perform the computation using shared memory
        c[index] = exp(shared_a[threadIdx.y * blockDim.x + threadIdx.x]);
    }
}