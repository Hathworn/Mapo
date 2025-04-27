#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float *outdata, float *indata) {
    // Utilize block and thread indices for parallel processing
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Guard against excess threads
    if (idx == 0) {
        outdata[idx] = indata[idx] == 0 ? 3.0f : 2.0f;
    }
}