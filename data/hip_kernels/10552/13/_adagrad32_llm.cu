#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _adagrad32(int n, double eps, float *dw2, float *dw) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride outside loop
    while (i < n) {
        float temp_dw = dw[i]; // Cache dw[i] to a register to reduce global memory access
        dw2[i] += temp_dw * temp_dw;
        dw[i] = temp_dw / sqrt(dw2[i] + eps);
        i += stride;
    }
}