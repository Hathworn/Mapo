#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prod_strided_double(int n, int xOffset, double *dx, int incx, double *result) {
    __shared__ double sharedResult;
    if (threadIdx.x == 0) {
        sharedResult = 1.0; // Initialize shared memory
    }
    __syncthreads();

    double threadResult = 1.0; // Initialize thread-local result

    // Optimize loop for coalesced memory access and reduction
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            threadResult *= dx[i];
        }
    }

    // Atomic multiplication to accumulate results in shared memory
    atomicExch(&sharedResult, sharedResult * threadResult); 
    __syncthreads();

    if (threadIdx.x == 0) {
        atomicExch(result, *result * sharedResult); // Update global result safely
    }
}