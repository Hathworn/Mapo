#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void coalesced(float *A, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for coalesced access
    __shared__ float sharedA[BLOCK_SIZE];
    
    if (i < N) {
        // Load data into shared memory
        sharedA[threadIdx.x] = A[i];
        __syncthreads(); // Ensure all loads are complete
        
        // Store from shared memory to global memory
        C[i] = sharedA[threadIdx.x];
    }
}
```
