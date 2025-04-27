#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permute_colors_kernel(int num_rows, int *row_colors, int *color_permutation)
{
    // Calculate global thread index
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a simpler loop increment to enhance performance
    while (row_id < num_rows)
    {
        int color = row_colors[row_id];
        // Use cached memory access if available
        #if __CUDA_ARCH__ >= 350
        color = __ldg(color_permutation + color);
        #else
        color = color_permutation[color];
        #endif
        row_colors[row_id] = color;

        // Move to the next row processed by this thread
        row_id += blockDim.x * gridDim.x;
    }
}