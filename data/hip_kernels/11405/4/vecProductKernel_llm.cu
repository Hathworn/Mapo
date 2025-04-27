#include "hip/hip_runtime.h"
#include "includes.h"

// Using shared memory to optimize memory access and reduce global memory traffic
__global__ void vecProductKernel(float *d_z, const float *d_x, const float *d_y, unsigned int N)
{
    extern __shared__ float shared_x[];
    extern __shared__ float shared_y[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (idx < N) {
        shared_x[threadIdx.x] = d_x[idx];
        shared_y[threadIdx.x] = d_y[idx];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (idx < N) {
        d_z[idx] = shared_x[threadIdx.x] * shared_y[threadIdx.x];
    }
}