#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, const float *indata) {
    // Check if the address of indata is null
    outdata[0] = (__ldg(indata) == 0) ? 3.0f : 2.0f;  // Use __ldg for faster global memory access
}