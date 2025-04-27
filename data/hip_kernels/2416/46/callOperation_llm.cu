#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperation(int *a, int *b, int x, int *res, int n) 
{
    // Use shared memory for faster access
    extern __shared__ int shared_a[];
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid < n) {
        shared_a[threadIdx.x] = a[tid]; // Load data into shared memory
        __syncthreads(); // Ensure all threads have loaded data

        // Perform calculation using shared memory
        res[tid] = (shared_a[threadIdx.x] * x) + b[tid];
    }
}