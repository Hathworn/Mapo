#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelC(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Loop until n with step size equal to stride
    for (int i = index; i < n; i += stride) {
        // Check the condition and process only when it's true to avoid unnecessary computations
        if (x[i] > y[i]) {
            float sum = 0.0f;
            // Pre-calculate sum to avoid repeated memory access
            for (int j = 0; j < n / CONST; j++) {
                sum += x[j] + y[j];
            }
            y[i] = sum;  // Store pre-calculated sum
        }
    }
}