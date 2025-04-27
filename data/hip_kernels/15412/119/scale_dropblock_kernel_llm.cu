#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_dropblock_kernel(float *output, int size, int outputs, float *drop_blocks_scale)
{
    // Calculate global thread index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition
    if (index < size) {
        // Calculate block index
        const int b = __ldg(&index) / outputs;
        
        // Perform the scaling operation
        output[index] *= __ldg(&drop_blocks_scale[b]);
    }
}