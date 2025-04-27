#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate the global thread index
    long o = blockIdx.x * blockDim.x + threadIdx.x;

    // Check to ensure the thread is within bounds
    if (o < nrows) {
        // Calculate the input offset
        long i = o * ncols;

        // Get the index from indices array, adjust for zero-based index
        long idx = static_cast<long>(indices[o]) - 1;

        // Perform the gradient update
        input[i + idx] = output[o];
    }
}