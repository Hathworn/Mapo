#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void recipSummation(double* data, double* recip, int len)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (i < len) {
        const int j = 2 * i;
        data[j]     *= recip[i];
        data[j + 1] *= recip[i];
    }
}