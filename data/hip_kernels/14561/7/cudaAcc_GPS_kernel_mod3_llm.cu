#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaAcc_GPS_kernel_mod3(int NumDataPoints, float2* FreqData, float* PowerSpectrum)
{
    const int sidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index within bounds
    if (sidx < NumDataPoints)
    {
        float2 freq = FreqData[sidx]; // Load once, use registers
        float ax = freq.x;
        float ay = freq.y;
        
        // Compute power spectrum using FMA
        PowerSpectrum[sidx] = __fmaf_rn(ax, ax, ay * ay);
    }
}