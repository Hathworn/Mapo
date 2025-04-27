#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void marshalling2(int *input_itemsets, int *tmp, int max_rows, int max_cols)
{
    // Calculate global thread coordinates
    int i = blockIdx.y * blockDim.y + threadIdx.y + max_rows;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if out of bounds
    if (i >= max_rows * 2 - 1 || j >= max_cols) return;

    // Streamline index calculation and condition check
    int index = (max_rows - 1 - j) * max_cols + j + 1 + (i - max_rows);
    tmp[i * max_cols + j] = (j < max_cols - (i - max_rows + 1)) ? input_itemsets[index] : 0;
}