#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void getValueChar(char *outdata, char *indata) {
    // Use thread index to allow parallel processing
    int idx = threadIdx.x;
    outdata[idx] = indata[idx] + 3;
}