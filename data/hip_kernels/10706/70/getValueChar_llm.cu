#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValueChar(char *outdata, char *indata) {
    // Calculate global index for the thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure we don't access out of bounds
    if (idx == 0) {
        outdata[idx] = indata[idx] + 3;
    }
}