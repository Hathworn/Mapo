#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use shared memory to load a tile of data 
    __shared__ float tile[256]; 

    // Compute a unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over segments of data
    for (int index = i; index < N; index += blockDim.x * gridDim.x)
    {
        // Load data into shared memory
        tile[threadIdx.x] = X[index * INCX];

        // Synchronize to ensure all threads have written to shared memory
        __syncthreads();

        // Perform the addition on data in shared memory
        tile[threadIdx.x] += ALPHA;
        
        // Ensure all threads have completed computation
        __syncthreads();

        // Store the result back to global memory
        X[index * INCX] = tile[threadIdx.x];
    }
}