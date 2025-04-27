#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale(float *a, float *b, float scale, size_t len)
{
    // Use shared memory to improve data locality and cache performance
    extern __shared__ float shared_a[]; 

    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (idx < len) {
        // Load elements to shared memory
        shared_a[threadIdx.x] = a[idx];
        __syncthreads();
        
        // Perform the scaling operation using shared memory
        b[idx] = scale * shared_a[threadIdx.x];
    }
}