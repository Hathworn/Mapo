#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy(int *dst, int *input_itemsets, int max_rows, int max_cols, int lb0, int lb1, int ub0, int ub1)
{
    // Calculate global row and column indices
    int r = blockIdx.y * blockDim.y + threadIdx.y + lb0;
    int c = blockIdx.x * blockDim.x + threadIdx.x + lb1;

    // Check if indices are within bounds
    if (r < ub0 && c < ub1)
    {
        // Compute 1D index and copy data
        int idx = r * max_cols + c;
        dst[idx] = input_itemsets[idx];
    }
}