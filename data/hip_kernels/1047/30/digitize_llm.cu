#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void digitize(float* idat, uint8_t* udat, size_t n)
{
    // Calculate the global thread ID
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use a stride loop to cover all elements
    int stride = blockDim.x * gridDim.x;
    
    for (; i < n; i += stride)
    {
        // Efficient normalization calculation
        float tmp = idat[i] * 16.9096462f + 128.5f;

        // Simplified clamping
        tmp = (tmp < 0.0f) ? 0.0f : ((tmp > 255.0f) ? 255.0f : tmp);
        
        // Direct casting to uint8_t
        udat[i] = (uint8_t)tmp;
    }
}