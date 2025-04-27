#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_h(float *X, float *Y, int size_in) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    if (t < size_in) {
        // Use max function for conditional assignment
        Y[t] = max(0.0f, X[t]);
    }
}