#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *scale, int batch, int filters, int spatial, int current_size)
{
    // Calculate global index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < current_size) {
        // Optimize index calculation to access scale
        int f = (index / spatial) % filters;
        output[index] *= scale[f];
    }
}