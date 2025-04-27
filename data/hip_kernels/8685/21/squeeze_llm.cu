#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified threadIdx and blockIdx calculation
    int target_index = index + length;                // Compute the actual index only once
    if (target_index < length + dim) {                // Merge bounds check logic for efficiency
        float value = B[target_index] - M;            // Precompute reused term for better performance
        B[target_index] = __frcp_rn(1 + expf(-L * value)); // Use reciprocal for numerically optimal performance
    }
}