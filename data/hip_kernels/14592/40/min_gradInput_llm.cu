```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate unique thread identifier for row processing
    long row_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (row_idx < nrows) {
        // Calculate input index for the given row
        long input_offset = row_idx * ncols;

        // Determine min index for gradient backpropagation
        long min_idx = static_cast<long>(indices[row_idx]) - 1;

        // Propagate the gradient to the corresponding input element
        input[input_offset + min_idx] = output[row_idx];
    }
}