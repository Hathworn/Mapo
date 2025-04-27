#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float4 *outdata, float *indata) {
    // Reordering memory access to enhance coalescing
    float4 my4 = make_float4(indata[0], indata[1], indata[2], indata[3]);
    outdata[0] = my4;
}