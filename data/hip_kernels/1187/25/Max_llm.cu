#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Max(const int n, const float *top_temp, float *top_data, float *mask, const int mask_index) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n) { // Combine boundary check with index usage
        float temp_val = top_temp[index]; // Cache memory access
        float top_val = top_data[index];
        if (top_val < temp_val) {
            top_data[index] = temp_val;
            mask[index] = mask_index;
        }
    }
}