#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void permute_colors_kernel(int num_rows, int *row_colors, int *color_permutation)
{
    int row_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop for simpler iteration control
    while (row_id < num_rows)
    {
        int color = row_colors[row_id];

        // Simplify condition checking with HIP built-in function support for constant memory
        color = __ldg(&color_permutation[color]);

        row_colors[row_id] = color;

        // Advance to the next row_id using grid-stride loop
        row_id += blockDim.x * gridDim.x;
    }
}