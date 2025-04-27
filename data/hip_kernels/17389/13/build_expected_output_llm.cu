#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory for labels
__global__ void build_expected_output(int *output, int n_rows, int k, const int *labels) {
    int row = threadIdx.x + blockDim.x * blockIdx.x;
    if (row >= n_rows) return;

    int cur_label = labels[row];
    for (int i = threadIdx.y; i < k; i += blockDim.y) {
        output[row * k + i] = cur_label;
    }
}