#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LoadVec(float *vector, float2 *FFT) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) { // Boundary check to prevent out-of-range access
        float val = vector[idx]; // Load vector element once
        FFT[idx] = make_float2(val, 0.0f); // Use make_float2 for cleaner assignment
    }
}