#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function
__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    // Compute global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Initialize shared memory to store comparison
    __shared__ int shared_cmp;
    if (threadIdx.x == 0) {
        shared_cmp = 0;
    }
    __syncthreads();

    // Perform comparison and store result in shared memory
    if (i < n && aptr[i] < bptr[i]) {
        atomicAdd(&shared_cmp, 1);
    }
    __syncthreads();

    // Write global result from shared memory
    if (threadIdx.x == 0 && shared_cmp > 0) {
        *rptr = 1;
    }
}