#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaKernel_estimateSnr(const float* __restrict__ corrSum, const int* __restrict__ corrValidCount, const float* __restrict__ maxval, float* __restrict__ snrValue, const int size)
{
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    if (idx < size) {
        // Use __restrict__ to potentially improve memory access patterns
        float mean = (corrSum[idx] - maxval[idx] * maxval[idx]) / (corrValidCount[idx] - 1);
        snrValue[idx] = maxval[idx] / mean;
    }
}