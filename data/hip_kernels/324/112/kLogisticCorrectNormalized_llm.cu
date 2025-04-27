#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLogisticCorrectNormalized(float* mat, float* targets, float* out, unsigned int height, unsigned int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < height) {
        float correct = 0;
        float total = 0;
        for (int i = idx; i < width * height; i += height) {
            // Use registers for frequently accessed values
            float p = mat[i];
            float t = targets[i];
            
            // Simplify condition checks to reduce branch divergence
            if (t >= 0) {
                correct += ((t >= 0.5) == (p >= 0.5)) ? 1 : 0;
                total += 1;
            }
        }
        
        // No need for __syncthreads() within a single thread loop
        out[idx] = (total > 0) ? (correct / total) : 0;
    }
}