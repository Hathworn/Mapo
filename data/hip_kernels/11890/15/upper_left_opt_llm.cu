#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ int maximum(int a, int b, int c) {
    return max(a, max(b, c)); // Simplified maximum function using max
}

__global__ void upper_left_opt(int *dst, int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    int r = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int c = blockIdx.x * blockDim.x + threadIdx.x + 1;
    
    if (r >= i + 1 || c >= i + 1) return; // Early exit if outside range

    if (blockIdx.x + blockIdx.y >= blockDim.x - 3 && r == (i - c + 1)) { // Single branch condition
        int base = r * max_cols + c;
        dst[base] = maximum(
            input_itemsets[base - max_cols - 1] + reference[base],
            input_itemsets[base - 1] - penalty,
            input_itemsets[base - max_cols] - penalty
        );
    }
}