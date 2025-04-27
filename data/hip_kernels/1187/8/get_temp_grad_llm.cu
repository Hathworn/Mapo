#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_temp_grad(const int n, const float *gradOutput, const float *mask, float *top_grad, const int mask_index) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < n) { // Reverse condition logic to reduce branching
        if (((int)mask[index]) == mask_index) {
            top_grad[index] = gradOutput[index];
        }
    }
}