#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void postprocess_matrix(float* matrix, long* long_indices, int* indices, unsigned int N_POINTS, unsigned int K)
{
    // Calculate the global thread ID
    unsigned int TID = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Bounds check
    if (TID < N_POINTS * K) {
        // Directly cast long index to int
        indices[TID] = static_cast<int>(long_indices[TID]);
    }
}