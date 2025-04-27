#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void min_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate the global index:
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Guard against out-of-bounds access:
    if (o < nrows) {
        // Compute input index and update gradient:
        long i = o * ncols;
        long idx = static_cast<long>(indices[o]) - 1; // Cast to handle fractional indices accurately
        input[i + idx] = output[o];
    }
}