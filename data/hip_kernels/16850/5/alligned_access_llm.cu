#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void alligned_access(float* a, int max) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < max) {
        // Use single if-statement to avoid out of bounds calculation
        a[idx] += 1.0f;
    }
}