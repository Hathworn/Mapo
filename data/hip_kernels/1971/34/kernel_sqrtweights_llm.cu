#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_sqrtweights(int N, double *wt) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better data caching
    extern __shared__ double shared_wt[];
    
    // Load data into shared memory
    if (tid < N) {
        shared_wt[threadIdx.x] = wt[tid];
        __syncthreads(); // Wait for all threads to load data

        // Compute square root and store back in shared memory
        shared_wt[threadIdx.x] = sqrt(shared_wt[threadIdx.x]);
        __syncthreads(); // Wait for all threads to complete computation

        // Store result back to global memory
        wt[tid] = shared_wt[threadIdx.x];
    }
}