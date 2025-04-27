#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 128
#define DISP_MAX 256

__global__ void rho(float *x, int size, float lambda)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to process larger data sets
    int stride = blockDim.x * gridDim.x;
    for (int i = id; i < size; i += stride) {
        x[i] = 1 - expf(-x[i] / lambda); // Use expf for single precision
    }
}