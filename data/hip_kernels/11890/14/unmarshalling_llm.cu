#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unmarshalling(int *input_itemsets, int *tmp, int max_rows, int max_cols)
{
    // Calculate global indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (i >= max_rows || j >= max_cols) return;

    // Optimize memory access and computation
    int index = i * max_cols + j;
    int index_in_tmp = (i + j) * max_cols + j;
    if ((i + j) < max_rows) {
        input_itemsets[index] = tmp[index_in_tmp];
    } else {
        input_itemsets[index] = tmp[index_in_tmp - (i + j - max_rows + 1)];
    }
}