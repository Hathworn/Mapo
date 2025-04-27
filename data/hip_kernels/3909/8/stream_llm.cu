#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stream(float* dA, float* dB, float* dC, float alpha, int N) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < N) {
        // Use shared memory for faster access
        __shared__ float sharedB[BLOCK_SIZE];
        __shared__ float sharedC[BLOCK_SIZE];
        
        sharedB[threadIdx.x] = dB[id];
        sharedC[threadIdx.x] = dC[id];
        
        __syncthreads();  // Ensure all data is available

        dA[id] = sharedB[threadIdx.x] + alpha * sharedC[threadIdx.x];
    }
}
```
