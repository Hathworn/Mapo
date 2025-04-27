```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reverse_colors_kernel(int num_rows, int max_color, int *row_colors)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute stride for coalesced memory access
    int stride = blockDim.x * gridDim.x;

    // Optimize loop iteration using stride
    for ( ; row_id < num_rows ; row_id += stride )
    {
        int color = row_colors[row_id];

        // Check and update color using conditional assignment
        if (color > 0)
        {
            // Reverse the color
            color = max_color - color + 1;
        }

        // Write the updated color back to memory
        row_colors[row_id] = color;
    }
}