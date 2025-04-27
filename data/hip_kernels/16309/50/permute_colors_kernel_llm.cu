#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permute_colors_kernel(int num_rows, int *row_colors, int *color_permutation)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize using a stride loop and remove redundant calculations
    int stride = blockDim.x * gridDim.x;
    for ( ; row_id < num_rows ; row_id += stride )
    {
        int color = row_colors[row_id];
        // Use __ldg if supported for better cache efficiency
        #if __CUDA_ARCH__ >= 350
        color = __ldg(color_permutation + color);
        #else
        color = color_permutation[color];
        #endif
        row_colors[row_id] = color;
    }
}