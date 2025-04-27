#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void max_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate global thread index for output
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    if (o < nrows) {
        // Compute input offset
        long i = o * ncols;
        
        // Index from indices array (convert from 1-based index)
        long idx = __ldg(&indices[o]) - 1;

        // Optimized memory access
        input[i + idx] = output[o];
    }
}