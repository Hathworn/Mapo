#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValueChar(char *outdata, char *indata) {
    // Use blockIdx and threadIdx to handle data more efficiently
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        outdata[idx] = indata[idx] + 3;
    }
}