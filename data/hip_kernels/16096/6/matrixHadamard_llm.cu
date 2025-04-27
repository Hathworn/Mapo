```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixHadamard(double *a, double *b, double *c, int cr, int cc) {
    // Use shared memory for improved memory access
    extern __shared__ double shared_mem[];
    double *shared_a = shared_mem;
    double *shared_b = &shared_mem[cc];

    long x = blockIdx.x * blockDim.x + threadIdx.x;
    long y = blockIdx.y * blockDim.y + threadIdx.y;

    // Load data into shared memory
    if (x < cc && y < cr) {
        shared_a[threadIdx.y * blockDim.x + threadIdx.x] = a[y * cc + x];
        shared_b[threadIdx.y * blockDim.x + threadIdx.x] = b[y * cc + x];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (x < cc && y < cr) {
        c[y * cc + x] = shared_a[threadIdx.y * blockDim.x + threadIdx.x] * shared_b[threadIdx.y * blockDim.x + threadIdx.x];
    }
}