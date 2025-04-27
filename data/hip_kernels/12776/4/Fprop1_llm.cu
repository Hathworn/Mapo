#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Fprop1(const float* in, const float* syn1, float* layer1)
{
    int i = threadIdx.x;                         // 256
    int k = blockIdx.x;                          // Data.count
    float x = 0.0;

    int stride = blockDim.x;                     // Optimize with loop unrolling
    for (int j = 0; j < 28*28; j += stride) {    
        int idx = j * 256 + i;
        float in_val = in[k * 28 * 28 + j + i];
        float syn_val = syn1[idx];
        x += in_val * syn_val;

        // Unroll the loop
        if ((j + 1) < 28 * 28) {
            in_val = in[k * 28 * 28 + j + i + 1];
            syn_val = syn1[idx + 256];
            x += in_val * syn_val;
        }
        if ((j + 2) < 28 * 28) {
            in_val = in[k * 28 * 28 + j + i + 2];
            syn_val = syn1[idx + 512];
            x += in_val * syn_val;
        }
        if ((j + 3) < 28 * 28) {
            in_val = in[k * 28 * 28 + j + i + 3];
            syn_val = syn1[idx + 768];
            x += in_val * syn_val;
        }
    }
    layer1[k * 256 + i] = x;
}