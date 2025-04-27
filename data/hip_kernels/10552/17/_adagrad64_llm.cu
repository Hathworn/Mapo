#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _adagrad64(int n, double eps, double *dw2, double *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate the stride size once

    for (; i < n; i += stride) { // Use a for loop with pre-calculated stride
        double dw_val = dw[i];
        double dw2_val = dw2[i];
        dw2_val += dw_val * dw_val; // Cache access in registers
        dw2[i] = dw2_val;
        dw[i] = dw_val / sqrt(dw2_val + eps); // Use cached value
    }
}