```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void min_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Get global thread index
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Check if thread index is out of bounds
    if (o >= nrows) return;

    // Precompute input offset
    long i = o * ncols;

    // Initialize min and argmin with first element
    float min = input[i];
    long argmin = 0;

    // Efficient loop to find min and its index
    for (long ii = 1; ii < ncols; ii++) {
        float val = input[i + ii];
        if (val < min) {
            min = val;
            argmin = ii;
        }
    }

    // Store results
    output[o] = min;
    indices[o] = argmin + 1;
}