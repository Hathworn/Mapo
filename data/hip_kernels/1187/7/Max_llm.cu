#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Max(const int n, const float *top_temp, float *top_data, float *mask, const int mask_index) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n && top_data[index] < top_temp[index]) { // Combine conditions for efficiency
        top_data[index] = top_temp[index];
        mask[index] = mask_index; 
    }
}