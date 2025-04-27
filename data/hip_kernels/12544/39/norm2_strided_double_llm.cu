#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void norm2_strided_double(int n, int xOffset, double *dx, int incx, double* result) {
    extern __shared__ double shared_data[];

    int tid = threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;
    double sum = 0.0;  // Use a register for local accumulation

    // Iterate over elements with striding
    for (int i = blockIdx.x * blockDim.x + tid; i < n; i += gridSize) {
        if(i >= xOffset && i % incx == 0) {
            sum += pow(dx[i], 2);
        }
    }

    shared_data[tid] = sum; // Store local sum in shared memory
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_data[tid] += shared_data[tid + s];
        }
        __syncthreads();
    }

    // First thread writes block's accumulated result to global memory
    if (tid == 0) {
        atomicAdd(result, shared_data[0]);
    }
}