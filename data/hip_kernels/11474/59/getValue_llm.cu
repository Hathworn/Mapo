#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float4 *outdata, float *indata) {
    // Use thread index for parallel execution
    int idx = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;

    // Load data efficiently using the thread index
    if (idx == 0) {
        outdata[idx] = make_float4(indata[0], indata[3], indata[1], indata[2]);
    }
}