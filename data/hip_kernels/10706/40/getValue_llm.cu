#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Use thread index to ensure data parallelism
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Conditional assignment with efficient memory access
    if (idx == 0) {
        outdata[idx] = (indata[0] == 0) ? 3.0f : 2.0f;
    }
}