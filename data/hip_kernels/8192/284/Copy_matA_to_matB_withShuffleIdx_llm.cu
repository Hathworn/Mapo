```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Copy_matA_to_matB_withShuffleIdx(float *A, float *B, int size, int cols, float *new_idxs, int max_rows) {
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    int irow = id / cols;
    int icol = id % cols;

    // Ensure mapping only valid threads
    if (id < size) {
        int irow_new = max_rows - 1 - irow;
        int irow_old = static_cast<int>(new_idxs[irow]); // Cast float idx to int
        B[irow_new * cols + icol] = A[irow_old * cols + icol];
    }
}