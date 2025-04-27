#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __host__ int maximum(int a, int b, int c) {
    // Use a concise ternary operation for maximum selection
    return max(max(a, b), c);
}

__global__ void middle(int *input_itemsets, int *reference, int *tmp, int max_rows, int max_cols, int i, int penalty) {
    int c = blockIdx.x * blockDim.x + threadIdx.x;

    // Early return based on condition
    if (c >= (max_cols - 1)) return;

    // Use direct indexing for calculations
    int ref_index = (max_rows - 1 - c) * max_cols + c + 1;
    tmp[max_rows * max_cols + c] = maximum(
        tmp[(max_rows - 2) * max_cols + c] + reference[ref_index],
        tmp[(max_rows - 1) * max_cols + c] - penalty,
        tmp[(max_rows - 1) * max_cols + c + 1] - penalty
    );
}