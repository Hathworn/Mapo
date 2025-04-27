#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reverse_colors_kernel(int num_rows, int max_color, int *row_colors)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Using strided loop to handle more work per warp
    for ( ; row_id < num_rows ; row_id += blockDim.x * gridDim.x )
    {
        int color = row_colors[row_id];

        // Conditional check and assignment combined for efficiency
        if (color > 0)
        {
            // Reverse the color value
            row_colors[row_id] = max_color - color + 1;
        }
        else
        {
            row_colors[row_id] = color;
        }
    }
}