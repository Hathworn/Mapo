#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_relu_h(float *X, float *Y, int size_in) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;

    // Simplifying the conditional operation using a ternary operator
    if (t < size_in) {
        X[t] = (X[t] >= 0) ? Y[t] : 0.0;
    }
}