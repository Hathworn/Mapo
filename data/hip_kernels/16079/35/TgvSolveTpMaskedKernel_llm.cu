#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TgvSolveTpMaskedKernel(float* mask, float*a, float *b, float*c, float2* p, float2* Tp, int width, int height, int stride) {
    // Calculate 1D flattened thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check thread bounds 
    if (ix >= width || iy >= height) return;

    int pos = ix + iy * stride;

    // Check mask condition
    if (mask[pos] == 0.0f) return;

    // Perform computations
    float2 pVal = p[pos];
    float2 tpVal;
    tpVal.x = a[pos] * pVal.x + c[pos] * pVal.y;
    tpVal.y = c[pos] * pVal.x + b[pos] * pVal.y;
    Tp[pos] = tpVal;
}