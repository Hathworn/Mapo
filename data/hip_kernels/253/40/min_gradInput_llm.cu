#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min_gradInput(float *input, float *output, float *indices, long nrows, long ncols)
{
    // Calculate the overall index for this thread
    long o = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the current index is within bounds
    if (o < nrows) {
        // Calculate input offset
        long i = o * ncols;
        
        // Get the index from the indices array and adjust for 0-based indexing
        long idx = static_cast<long>(indices[o]) - 1;
        
        // Assign the output value to the corresponding position in the input
        input[i + idx] = output[o];
    }
}