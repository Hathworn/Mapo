#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sparse_mat_compact(int * input, int * output, int * output_index_array, int array_size)
{
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Improved memory access by including gid == 0, minimizing conditional checks
    if (gid < array_size)
    {
        int current_index = output_index_array[gid];
        if (gid == 0 || current_index != output_index_array[gid - 1])
        {
            // Directly store input value to avoid additional look-up
            output[current_index] = gid == 0 ? input[gid] : input[gid - 1];
        }
    }
}