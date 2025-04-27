```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compact2d_1D_array(int * input, int * output, int * output_column_index_array, int * output_row_index_array, int * prev_output_index_array, int* auxiliry_array, int array_size)
{
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit for out-of-bound gid
    if (gid >= array_size) return;

    // Perform operation starting from gid = 1
    if (gid > 0)
    {
        // Process elements where previous index differs
        if (prev_output_index_array[gid] != prev_output_index_array[gid - 1])
        {
            // Store the previous input in the current output position
            output[prev_output_index_array[gid]] = input[gid - 1];
            output_column_index_array[prev_output_index_array[gid]] = (gid - 1) % blockDim.x;
        }
        
        int colum_index = gid / (blockDim.x - 1); // Correct typo: column_index
        int condition = gid % (blockDim.x - 1);

        // Check for row index updates
        if (condition == 0)
        {
            if (gid == 0)
            {
                output_row_index_array[0] = 0;
            }
            else
            {
                output_row_index_array[colum_index] = prev_output_index_array[gid];
            }
        }
    }
}