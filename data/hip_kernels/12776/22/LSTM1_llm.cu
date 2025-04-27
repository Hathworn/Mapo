#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float tanh_(float x)
{
    float exp2x = exp(2.0 * x);
    return (exp2x - 1.0) / (exp2x + 1.0);
}

__global__ void LSTM1(float* __restrict__ layer1, float* __restrict__ lstm1, const float* __restrict__ gate1i, const float* __restrict__ gate1o, const int offset)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // 256 threads per block

    // Use registers to minimize redundant memory access
    float g_i = gate1i[256 * offset + i];
    float g_f = 1.0f - g_i;
    float g_o = gate1o[256 * offset + i];
    float layer1_val = layer1[256 * offset + i];
    
    float i_t = tanh_(layer1_val) * g_i;
    float i_p = 0.0f;

    if (offset > 0) {
        i_p = g_f * lstm1[256 * (offset - 1) + i];
    }

    float sum = i_p + i_t;
    lstm1[256 * offset + i] = sum;
    layer1[256 * offset + i] = tanh_(sum) * g_o;
}