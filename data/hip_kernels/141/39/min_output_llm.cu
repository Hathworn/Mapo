#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate the global thread index
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that the thread index is within range
    if (o >= nrows) return;

    // Calculate input offset
    long i = o * ncols;
    
    // Initialize minimum and index values
    float min = input[i];
    long argmin = 0;
    
    // Loop unrolling for better performance when ncols is large
    for (long ii = 1; ii < ncols; ii += 4) {
        if (ii + 0 < ncols && input[i + ii + 0] < min) {
            min = input[i + ii + 0];
            argmin = ii + 0;
        }
        if (ii + 1 < ncols && input[i + ii + 1] < min) {
            min = input[i + ii + 1];
            argmin = ii + 1;
        }
        if (ii + 2 < ncols && input[i + ii + 2] < min) {
            min = input[i + ii + 2];
            argmin = ii + 2;
        }
        if (ii + 3 < ncols && input[i + ii + 3] < min) {
            min = input[i + ii + 3];
            argmin = ii + 3;
        }
    }

    // Store results
    output[o] = min;
    indices[o] = argmin + 1;
}