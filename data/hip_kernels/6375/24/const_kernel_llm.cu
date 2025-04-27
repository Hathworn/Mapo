#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use block and thread indexing to calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Check the condition within the loop for slightly better performance
    if(i < N) 
    {
        // Unroll the loop where possible for better memory access
        #pragma unroll
        for(int offset = 0; offset < INCX; ++offset)
        {
            X[i * INCX + offset] = ALPHA;
        }
    }
}