#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ int maximum(int a, int b, int c) {
    int max_val = max(max(a, b), c); // Use built-in max function for clarity
    return max_val;
}

__global__ void lower_right_opt(int *dst, int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    int r = blockIdx.y * blockDim.y + threadIdx.y + i + 1; // Calculate row index
    int c = blockIdx.x * blockDim.x + threadIdx.x + i + 1; // Calculate column index

    if (r >= max_rows || c >= max_cols || r != (max_cols - c + i)) return; // Combine conditions for early return

    // Compute the maximum value and store
    dst[r * max_cols + c] = maximum(
        input_itemsets[(r - 1) * max_cols + c - 1] + reference[r * max_cols + c],
        input_itemsets[r * max_cols + c - 1] - penalty,
        input_itemsets[(r - 1) * max_cols + c] - penalty
    );
}