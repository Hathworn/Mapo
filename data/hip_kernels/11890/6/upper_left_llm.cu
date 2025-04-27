#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ int maximum(int a, int b, int c) {
    // Optimize maximum computation using ternary operator
    return (a >= b) ? ((a >= c) ? a : c) : ((b >= c) ? b : c);
}

__global__ void upper_left(int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= i) return;

    int r = i - idx;
    int c = i + 1 - r;
    int base = r * max_cols + c;

    // Simplified calculation by accessing input_itemsets only once
    int ref_value = reference[base];
    int max_col_c = base - max_cols;
    int input_base = input_itemsets[base];
    int max_base_pos = input_itemsets[max_col_c - 1] + ref_value;

    input_itemsets[base] = maximum(max_base_pos,
                                   input_itemsets[base - 1] - penalty,
                                   input_itemsets[max_col_c] - penalty);
}