#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_output(float *input, float *output, float *indices, long nrows, long ncols) {
    // Compute global thread index
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    if (o >= nrows) return;

    // Locate row in input matrix
    long i = o * ncols;

    // Initialize max and argmax
    float max = input[i];
    long argmax = 0;

    // Unroll loop to reduce branches and improve performance
    for (long ii = 1; ii < ncols; ++ii) {
        float val = input[i + ii];
        if (val > max) {
            max = val;
            argmax = ii;
        }
    }

    // Store results
    output[o] = max;
    indices[o] = argmax + 1;
}