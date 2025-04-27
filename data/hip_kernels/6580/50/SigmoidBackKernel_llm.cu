#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SigmoidBackKernel(float* Z, float* dZ, int size) {
    // Calculate unique thread id
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id is within the bounds
    if (id < size) {
        float t = Z[id];
        // Use fmaf for better precision and potential performance gain
        dZ[id] = dZ[id] * fmaf(-t, t, t);
    }
}