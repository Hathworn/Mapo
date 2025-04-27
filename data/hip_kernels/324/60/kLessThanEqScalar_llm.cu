```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kLessThanEqScalar(float* mat, float val, float* target, unsigned int len) {
// Calculate the global index
const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
if (idx < len) { // Ensure the thread processes only if inside the bounds
    target[idx] = mat[idx] <= val;
}
}