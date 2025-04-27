#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization: Inline maximum function to reduce function call overhead
__device__ __host__ __forceinline__ int maximum_inline(int a, int b, int c) {
    int k = (a <= b) ? b : a;
    return (k <= c) ? c : k;
}

__global__ void lower_right(int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Return immediately if index is out of bound
    if (idx >= i) return;

    int r = max_rows - 1 - idx;
    int c = max_cols - i + idx;
    int base = r * max_cols + c;

    // Use inline maximum function
    input_itemsets[base] = maximum_inline(
        input_itemsets[base - max_cols - 1] + reference[base],
        input_itemsets[base - 1] - penalty,
        input_itemsets[base - max_cols] - penalty
    );
}