#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __linComb(float *X, float wx, float *Y, float wy, float *Z, int len) {
// Calculate global thread ID
int idx = blockIdx.x * blockDim.x + threadIdx.x;
int stride = blockDim.x * gridDim.x;

// Loop through the array using a stride
for (int i = idx; i < len; i += stride) {
    Z[i] = X[i]*wx + Y[i]*wy; // Compute the linear combination
}
}