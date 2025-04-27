#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float4 *outdata, float *indata) {
    // Use thread indexing for parallel processing
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx == 0) {
        float4 my4 = make_float4(indata[0], indata[3], indata[1], indata[2]);
        outdata[0] = my4;
    }
}