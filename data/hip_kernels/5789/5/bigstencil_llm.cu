#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* in, int* out) {
    // Cache the value of in[i] to register
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int value = in[i];
    out[i] = value + 2;
}