#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_temp_grad(const int n, const float *gradOutput, const float *mask, float *top_grad, const int mask_index) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within the bounds
    if (index < n) {
        // Use mask matching condition to determine grad assignment
        if (__float_as_int(mask[index]) == mask_index) {
            top_grad[index] = gradOutput[index];
        }
    }
}