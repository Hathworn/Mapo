#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Use thread index to allow for parallel execution
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < 1) {
        outdata[idx] = indata[idx] + 3.0f;
    }
}