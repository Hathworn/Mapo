#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Counting(int* HalfData, int HalfDataSize, int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling for better performance
    int stride = blockDim.x * gridDim.x;
    for (int idx = i; idx < HalfDataSize; idx += stride) {
        HalfData[idx] *= N;
    }
}