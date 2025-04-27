#include "hip/hip_runtime.h"
#include "includes.h"
#define B 2

__global__ void cudaAcc_GetPowerSpectrum_kernel2(int NumDataPoints, float2* FreqData, float* PowerSpectrum)
{
    // Calculate starting index for the thread
    const int index = blockIdx.x * blockDim.x * B + threadIdx.x;

    // Pre-loading data into registers for coalesced memory access
    float2 freqData[B];

    #pragma unroll
    for (int k = 0; k < B; k++)
    {
        freqData[k] = FreqData[index + k * blockDim.x];
    }

    #pragma unroll
    for (int k = 0; k < B; k++)
    {
        float ax = freqData[k].x;
        float ay = freqData[k].y;
        PowerSpectrum[index + k * blockDim.x] = __fadd_rn(__fmul_rn(ax, ax), __fmul_rn(ay, ay));
    }
}