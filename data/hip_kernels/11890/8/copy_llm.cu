#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy(int *dst, int *input_itemsets, int max_rows, int max_cols, int lb0, int lb1, int ub0, int ub1)
{
    // Calculate global row and column index
    int r = blockIdx.y * blockDim.y + threadIdx.y + lb0;
    int c = blockIdx.x * blockDim.x + threadIdx.x + lb1;

    // If indexes are out of bounds return immediately
    if (r >= ub0 || c >= ub1) return;

    // Calculate 1D index in the array and copy the value
    int idx = r * max_cols + c;
    dst[idx] = input_itemsets[idx];
}