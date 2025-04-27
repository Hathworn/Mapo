```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ int maximum(int a, int b, int c) {
    // Simplified maximum calculation
    return max(max(a, b), c);
}

__global__ void upper_left_copy(int *dst, int *input_itemsets, int *reference, int max_rows, int max_cols, int i, int penalty) {
    int r = blockIdx.y * blockDim.y + threadIdx.y + 1;
    int c = blockIdx.x * blockDim.x + threadIdx.x + 1;

    // Early exit if out of bounds
    if (r >= i + 1 || c >= i + 1) return;
    
    int base = r * max_cols + c;
    
    if (r == (i - c + 1)) {
        // Combined reference calculation
        dst[base] = maximum(input_itemsets[base - max_cols - 1] + reference[base],
                           input_itemsets[base - 1] - penalty,
                           input_itemsets[base - max_cols] - penalty);
    } else {
        dst[base] = input_itemsets[base];
    }
}