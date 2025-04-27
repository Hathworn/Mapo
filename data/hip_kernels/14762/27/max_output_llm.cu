#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_output(float *input, float *output, float *indices, long nrows, long ncols)
{
    // output offset:
    long o = threadIdx.x + blockDim.x * blockIdx.x;
    if (o >= nrows) return;

    // input offset:
    long i = o * ncols;

    // compute max:
    float max = input[i];
    long argmax = 0;
    #pragma unroll
    for (long ii = 1; ii < ncols; ii++) {
        float val = input[i + ii];
        if (val > max) {
            max = val;
            argmax = ii;
        }
    }

    // store
    output[o] = max;
    indices[o] = argmax + 1;
}