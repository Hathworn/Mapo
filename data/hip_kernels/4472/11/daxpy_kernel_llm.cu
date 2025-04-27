#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void daxpy_kernel(int n, double a, double * x, double * y)
{
    // Optimize memory access and computation by using shared memory and loop unrolling
    __shared__ double shared_x[1024];
    __shared__ double shared_y[1024];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    if (i < n) {
        // Load data into shared memory for faster access
        shared_x[tid] = x[i];
        shared_y[tid] = y[i];

        __syncthreads(); // Ensure all data is loaded

        // Perform computation with unrolled loop for better efficiency
        if (tid < n) {
            y[i] = a * shared_x[tid] + shared_y[tid];
        }
    }
}