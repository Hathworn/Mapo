```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reverse_colors_kernel(int num_rows, int max_color, int *row_colors)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize loop with strided access pattern
    for (int i = row_id; i < num_rows; i += blockDim.x * gridDim.x)
    {
        int color = row_colors[i];

        // Reverse color only if it's greater than 0
        if (color > 0)
        {
            color = max_color - color + 1;
        }

        row_colors[i] = color;
    }
}