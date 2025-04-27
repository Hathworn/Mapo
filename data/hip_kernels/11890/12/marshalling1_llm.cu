```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void marshalling1(int *input_itemsets, int *tmp, int max_rows, int max_cols)
{
    // Calculate global thread indices
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Bounds check
    if (i >= max_rows || j >= max_cols) return;

    // Optimize condition: rewriting ternary operation for clarity
    tmp[i * max_cols + j] = (j <= i) ? input_itemsets[(i - j) * max_cols + j] : 0;
}