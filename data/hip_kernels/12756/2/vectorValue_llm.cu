#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorValue (float *a, float *b, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds prior to performing operations
    if (i < n) {
        // Combine calculations to reduce redundant accesses
        float val = static_cast<float>(threadIdx.x);
        a[i] = val * 2.0f;
        b[i] = val;
    }
}