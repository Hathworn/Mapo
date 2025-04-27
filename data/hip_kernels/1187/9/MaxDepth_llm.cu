#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MaxDepth(const int n, const float *bottom_data, const int step, const int depth, float *idx) {
    // Calculate the unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (index >= n) return;

    int base = index / step * step * depth + index % step;
    float max_val = bottom_data[base];
    int max_k = 0;

    // Unroll the loop to improve performance
    for (int i = 1; i < depth; ++i) {
        float val = bottom_data[base + i * step];
        if (val > max_val) {
            max_val = val;
            max_k = i;
        }
    }
    // Store the result in the output index
    idx[index] = max_k;
}