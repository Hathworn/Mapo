#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Using blockIdx.x and threadIdx.x for indexing allows this kernel to handle larger data arrays.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) { // Limited work to only one thread as original logic implies operation on indata[0].
        outdata[0] = indata[0] + 3.0f;
    }
}