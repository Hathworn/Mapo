#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void timeDomainConvolutionNaive(float* ibuf, float* rbuf, float* obuf, long long oframes, long long rframes, int ch, float gain) {
    int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    if (threadID < oframes) { // Ensure threadID is within valid range
        float value = 0.0f;
        for (int k = 0; k < rframes; k++) {
            if (threadID >= k) { // Ensure indexing within bounds
                value += ibuf[threadID - k] * rbuf[k];
            }
        }
        obuf[threadID * 2 + ch] = value * gain;
    }
}