#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpb_y_i32 (int a, int* x, int b, int* y, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        int tmp = y[idx]; // Load y[idx] to register
        tmp *= a * x[idx] + b; // Perform operation in register
        y[idx] = tmp; // Store result back to y[idx]
    }
}