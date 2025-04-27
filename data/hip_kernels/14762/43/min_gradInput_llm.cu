#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate unique global index for the thread.
    long o = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure o is within bounds to avoid unnecessary calculations.
    if (o < nrows) {
        // Compute input offset.
        long i = o * ncols;

        // Retrieve index, adjust it, and update input.
        long idx = static_cast<long>(indices[o]) - 1;
        input[i + idx] = output[o];
    }
}