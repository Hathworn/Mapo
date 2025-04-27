#include "hip/hip_runtime.h"
#include "includes.h"

// Use cooperative groups for better synchronization
__global__ void max_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate output offset using blockIdx.x and threadIdx.x
    long o = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if thread corresponds to valid row
    if (o < nrows) {
        // Calculate input offset
        long i = o * ncols;

        // Calculate index and update input
        long idx = static_cast<long>(indices[o]) - 1;
        if (idx >= 0 && idx < ncols) {
            // Using atomic operation for potential concurrent writes
            atomicAdd(&input[i + idx], output[o]);
        }
    }
}