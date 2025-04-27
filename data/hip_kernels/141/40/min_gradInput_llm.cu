#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate output offset using ID comparison with total nrows instead of extra condition
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    if (o < nrows)
    {
        // Calculate input offset once
        long i = o * ncols;
        
        // Calculate index directly and assign
        long idx = __float2int_rd(indices[o]) - 1;
        input[i + idx] = output[o];
    }
}