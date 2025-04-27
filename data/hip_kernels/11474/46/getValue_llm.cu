#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Use block and thread index to allow parallel execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Process the first element only
        outdata[idx] = indata[idx] + 3.0f;
    }
}