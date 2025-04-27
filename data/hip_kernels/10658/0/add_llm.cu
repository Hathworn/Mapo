#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    // Use shared memory for partial results to optimize memory access
    extern __shared__ float shared[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < n)
    {
        shared[threadIdx.x] = a[i] + 2 * b[i];
        __syncthreads(); // Ensure all threads have completed their work 

        // Write the final result back to global memory
        sum[i] = shared[threadIdx.x];
    }
}