#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_scales_dropblock_kernel(float *drop_blocks_scale, int block_size_w, int block_size_h, int outputs, int batch)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds to prevent unnecessary computations
    if (index < batch) {
        const float prob = drop_blocks_scale[index] / (float)outputs;
        
        // Apply scaling calculation only if probability is less than 1
        drop_blocks_scale[index] = (prob < 1.0f) ? 1.0f / (1.0f - prob) : 0.0f;
    }
}