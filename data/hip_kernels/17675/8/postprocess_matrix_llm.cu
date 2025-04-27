#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void postprocess_matrix(float* matrix, long* long_indices, int* indices, unsigned int N_POINTS, unsigned int K)
{
    // Calculate global thread ID
    int TID = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure TID is within bounds
    if (TID < N_POINTS * K) {
        // Directly transfer the value from long_indices to indices
        indices[TID] = static_cast<int>(long_indices[TID]);
    }
}