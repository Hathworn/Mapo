#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void build_expected_output(int *output, int n_rows, int k, const int *labels) {
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    if (row < n_rows) {  // Move condition check inside to avoid extra return
        int cur_label = labels[row];
        int base_index = row * k;  // Precompute base index for memory access
        for (int i = 0; i < k; i++) {
            output[base_index + i] = cur_label;  // Use precomputed base index
        }
    }
}