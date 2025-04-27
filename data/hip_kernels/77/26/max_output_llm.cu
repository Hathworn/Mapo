#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_output(float *input, float *output, float *indices, long nrows, long ncols) {
    // Calculate the global output index
    long o = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;
    
    // Ensure output index is within the number of rows
    if (o >= nrows) return;

    // Compute input index offset directly using 'o'
    long i = o * ncols;
    
    // Set input pointer offset
    input += i;

    // Initialize max value and index.
    float max = input[0];
    long argmax = 0;

    // Unrolls the loop for better parallel execution
    for (long ii = 1; ii < ncols; ++ii) {
        float val = input[ii];
        if (val > max) {
            max = val;
            argmax = ii;
        }
    }

    // Store max value and its index in respective output arrays
    output[o] = max;
    indices[o] = argmax + 1; // Adjusting index for legacy reasons
}