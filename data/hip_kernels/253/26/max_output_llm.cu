#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate output offset
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    if (o >= nrows) return;

    // Calculate input offset
    long i = o * ncols;

    // Initialize max and argmax
    float max = input[i];
    long argmax = 0;

    // Iterate over columns to find the max value and its index
    for (long ii = 1; ii < ncols; ++ii) {
        float val = input[i + ii];
        if (val > max) {
            max = val;
            argmax = ii;
        }
    }

    // Store max value and 1-based index
    output[o] = max;
    indices[o] = argmax + 1;
}