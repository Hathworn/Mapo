#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gShift(float* out, const float* in, int length, int offset) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop over elements with a stride of total number of threads
    for(int idx = index; idx < length; idx += blockDim.x * gridDim.x) {
        // Check boundary conditions
        if(idx - offset < 0 || idx - offset >= length)
            out[idx] = 0;
        else
            out[idx] = in[idx - offset];
    }
}