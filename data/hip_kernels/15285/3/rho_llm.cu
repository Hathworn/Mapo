#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void rho(float *x, int size, float lambda)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Process multiple elements if out of bounds
    for (int i = id; i < size; i += stride) {
        x[i] = 1 - exp(-x[i] / lambda);
    }
}