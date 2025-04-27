#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, const float *indata) {
    // Use blockIdx.x and threadIdx.x to allow parallel processing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that outdata[0] is updated using the first thread
    if (idx == 0) {
        outdata[0] = (*indata == 0) ? 3.0f : 2.0f;
    }
}