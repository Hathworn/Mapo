#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *g_data, float value)
{
    // Use shared memory for faster access within a block
    __shared__ float s_value;
    
    // Load value to shared memory outside the loop
    if (threadIdx.x == 0)
    {
        s_value = value;
    }
    __syncthreads();
    
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform the addition using shared memory
    g_data[idx] += s_value;
}