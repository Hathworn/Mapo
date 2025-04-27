#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __host__ int maximum(int a, int b, int c) {
    int k;
    if (a <= b)
        k = b;
    else
        k = a;

    if (k <= c)
        return c;
    else
        return k;
}

__global__ void lower_right(int* input_itemsets, int* reference, int* tmp, int max_rows, int max_cols, int i, int penalty) {
    int c = blockIdx.x * blockDim.x + threadIdx.x;
    int r = i;

    if (c < (max_cols - (i - max_rows + 1))) {
        // Precompute indices to reduce repetitive calculations
        int idx_r_max_cols = r * max_cols;
        int idx_r_minus1_max_cols = (r - 1) * max_cols;
        int idx_r_minus2_max_cols = (r - 2) * max_cols;
        int ref_index = (max_rows - 1 - c) * max_cols + c + (i - max_rows + 1);

        // Perform the calculation using precomputed indices
        tmp[idx_r_max_cols + c] = maximum(
            tmp[idx_r_minus2_max_cols + c + 1] + reference[ref_index],
            tmp[idx_r_minus1_max_cols + c] - penalty,
            tmp[idx_r_minus1_max_cols + c + 1] - penalty
        );
    }
}