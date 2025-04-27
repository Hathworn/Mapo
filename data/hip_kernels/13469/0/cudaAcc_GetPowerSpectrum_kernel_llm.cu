#include "hip/hip_runtime.h"
#include "includes.h"
#define B 2

// Kernel function to calculate power spectrum
__global__ void cudaAcc_GetPowerSpectrum_kernel(int NumDataPoints, float2* FreqData, float* PowerSpectrum) {
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary to prevent accessing out-of-bounds memory
    if (i < NumDataPoints) {
        float ax = FreqData[i].x;
        float ay = FreqData[i].y;
        // Use optimized fused multiply-add operations
        PowerSpectrum[i] = __fmaf_rn(ax, ax, __fmul_rn(ay, ay));
    }
}