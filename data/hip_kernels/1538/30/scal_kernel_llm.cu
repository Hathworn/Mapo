#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use shared memory for coalesced access
    __shared__ float shared_X[1024]; 
    
    // Calculate the global index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Check and load element into shared memory
    if(i < N)
    {
        shared_X[threadIdx.x] = X[i * INCX];
        
        // Synchronize all threads
        __syncthreads();
        
        // Multiply the element by ALPHA
        shared_X[threadIdx.x] *= ALPHA;
        
        // Synchronize all threads
        __syncthreads();
        
        // Store results back to global memory
        X[i * INCX] = shared_X[threadIdx.x];
    }
}