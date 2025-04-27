#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x + length;
    
    // Use only valid threads
    if (index < length + dim) {
        // Pre-calculate the displacement to reduce redundant computation
        float temp_val = -(L * (B[index] - M));
        B[index] = 1.0f / (1.0f + expf(temp_val));
    }
}