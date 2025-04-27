#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reverse_colors_kernel(int num_rows, int max_color, int *row_colors)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for better performance on large arrays
    int stride = blockDim.x * gridDim.x;
    for ( ; row_id < num_rows ; row_id += stride ) 
    {
        int color = row_colors[row_id];

        if (color > 0)
        {
            // Reverse color: 1 -> max_color, max_color -> 1
            color = max_color - color + 1;
        }
        
        row_colors[row_id] = color;
    }
}