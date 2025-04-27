#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate output offset
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    if (o >= nrows) return;

    // Calculate input offset
    long i = o * ncols;

    // Initialize min and argmin with the first element
    float min = input[i];
    long argmin = 0;

    // Unroll loop to improve performance
    #pragma unroll
    for (long ii = 1; ii < ncols; ++ii) {
        float val = input[i + ii];  // Compute element address directly
        if (val < min) {
            min = val;
            argmin = ii;
        }
    }

    // Store results
    output[o] = min;
    indices[o] = argmin + 1;
}