#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate the index for the output
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    if (o < nrows) {
        // Calculate input offset
        long i = o * ncols;
        
        // Calculate index and update input
        long idx = indices[o] - 1;
        input[i + idx] = output[o];
    }
}