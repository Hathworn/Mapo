#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sam_kernel(float *in_w_h_c, int size, int channel_size, float *scales_c, float *out)
{
    // Calculate index once and reuse
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop to improve performance
    if (index < size) {
        #pragma unroll
        for (int i = index; i < size; i += gridDim.x * blockDim.x) {
            out[i] = in_w_h_c[i] * scales_c[i];
        }
    }
}