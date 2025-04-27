#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permute_colors_kernel(int num_rows, int *row_colors, int *color_permutation)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize loop to avoid branch divergence and to improve memory coalescing
    while (row_id < num_rows)
    {
        int color = row_colors[row_id];

        // Use of __ldg intrinsic function optimized for newer GPU architectures
        #if __CUDA_ARCH__ >= 350
        color = __ldg(color_permutation + color);
        #else
        color = color_permutation[color];
        #endif

        row_colors[row_id] = color;
        
        row_id += blockDim.x * gridDim.x;
    }
}