#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Copy_matA_to_matB_withShuffleIdx(float *A, float *B, int size, int cols, float *new_idxs, int max_rows) {
    // Calculate unique thread ID in the grid
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    // Calculate row and column indices
    int irow = id / cols;
    int icol = id % cols;

    // Check if within valid range
    if (id < size) {
        // Reverse row index for output
        int irow_new = max_rows - 1 - irow;
        
        // Fetch the old row index from new_idxs
        int irow_old = __float2int_rd(new_idxs[irow]); // Use efficient conversion
        
        // Copy data from A to B with re-mapped indices
        B[irow_new * cols + icol] = A[irow_old * cols + icol];
    }
}