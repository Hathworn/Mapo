#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void postprocess_matrix(float* matrix, long* long_indices, int* indices, unsigned int N_POINTS, unsigned int K)
{
    // Calculate unique thread ID
    int TID = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit if out of bounds
    if (TID >= N_POINTS * K) return;

    // Transfer long index to integer index
    indices[TID] = static_cast<int>(long_indices[TID]);
}