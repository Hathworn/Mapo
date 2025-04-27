```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Improve parallelism by processing multiple elements per thread
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    long stride = blockDim.x * gridDim.x;

    for (; o < nrows; o += stride) {
        // input offset:
        long i = o * ncols;

        // bprop max gradient:
        long idx = indices[o] - 1;
        input[i + idx] = output[o];
    }
}