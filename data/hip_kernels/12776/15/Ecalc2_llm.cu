#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Ecalc2(float* out, const float* label)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global index
    if (idx < /* Add appropriate bounds checking logic, e.g., array size */) {
        out[idx] = label[idx] - out[idx]; // Perform subtraction operation
    }
}