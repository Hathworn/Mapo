#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Iterate through elements with a stride pattern to cover large data sizes
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        // Efficiently clamp the input value between min_val and max_val
        float val = in[i];
        if (val < min_val) {
            out[i] = min_val;
        } else if (val > max_val) {
            out[i] = max_val;
        } else {
            out[i] = val;
        }
    }
}