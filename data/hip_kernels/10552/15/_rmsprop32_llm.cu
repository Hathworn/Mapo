#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _rmsprop32(int n, double eps, double rho, float *dw2, float *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    // Use a loop stride for efficient parallelization
    for (; i < n; i += stride) {
        // Calculate updated dw2 and apply RMSProp formula
        float dw_temp = dw[i]; // Cache access to dw[i]
        dw2[i] = dw2[i] * rho + (1 - rho) * dw_temp * dw_temp;
        dw[i] = dw_temp / sqrtf(dw2[i] + eps); // Use sqrtf for float precision
    }
}