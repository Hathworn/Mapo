#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int n, float *x, float *y)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access latency
    extern __shared__ float shared_x[];
    
    // Load data into shared memory
    if (index < n) {
        shared_x[threadIdx.x] = x[index];
        __syncthreads();  // Synchronize threads within the block

        // Perform computation using shared memory
        for (int i = index; i < n; i += stride) {
            y[i] = shared_x[threadIdx.x] + y[i];
        }
    }
}