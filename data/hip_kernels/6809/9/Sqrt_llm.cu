#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void Sqrt(float *x, size_t idx, size_t N, float W0) {
    // Use shared memory for coefficients if needed in larger context        
    size_t stride = blockDim.x * gridDim.x;
    size_t offset = (idx - 1) * N;

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += stride) {
        float val = x[offset + i];
        x[offset + i] = sqrtf(fabsf(val) * W0);  // Use sqrtf and fabsf for better performance
    }
}