#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Compute global thread index
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    if (o >= nrows) return;

    // Input offset computation remains unchanged
    long i = o * ncols;
    
    // Initialize max and argmax with first element details
    float max = input[i];
    long argmax = 0;

    // Loop to find max value and its index more efficiently
    for (long ii = 1; ii < ncols; ii++) {
        float val = input[i + ii];
        if (val > max) {
            max = val;
            argmax = ii;
        }
    }

    // Store computed max and its index
    output[o] = max;
    indices[o] = argmax + 1;
}