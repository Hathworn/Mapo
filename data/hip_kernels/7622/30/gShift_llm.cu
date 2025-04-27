#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gShift(float* out, const float* in, int length, int offset) {
    // Calculate the global index for the current thread.
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use single loop iteration for simplicity and efficiency.
    if (index < length) {
        // Check index boundaries to prevent memory access violations.
        if (index - offset < 0 || index - offset >= length)
            out[index] = 0;
        else
            out[index] = in[index - offset];
    }
}