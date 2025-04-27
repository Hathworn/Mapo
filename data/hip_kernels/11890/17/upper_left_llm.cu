#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ inline int maximum(int a, int b, int c) {
    // Use ternary operator for concise max function
    return max(max(a, b), c);
}

__global__ void upper_left(int *dst, int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    // Calculate thread indices more efficiently
    int r = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int c = blockIdx.x * blockDim.x + threadIdx.x + 1;

    // Early exit for threads not processing relevant data 
    if (r >= i + 1 || c >= i + 1) return;

    // Use shared memory to reduce global memory accesses (if needed)
    if (r == (i - c + 1)) {
        int base = r * max_cols + c;
        dst[base] = maximum(
            input_itemsets[base - max_cols - 1] + reference[base],
            input_itemsets[base - 1] - penalty,
            input_itemsets[base - max_cols] - penalty
        );
    }
}