#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Output offset:
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    if (o >= nrows) return;

    // Input offset:
    long i = o * ncols;

    // Move pointers
    input = input + i;

    // Initialize min and argmin variables
    float min = input[0];
    long argmin = 0;

    // Compute min using loop unrolling
    #pragma unroll 4
    for (long ii = 1; ii < ncols; ii++) {
        float val = input[ii];
        if (val < min) {
            min = val;
            argmin = ii;
        }
    }

    // Store results
    output[o] = min;
    indices[o] = argmin + 1;
}