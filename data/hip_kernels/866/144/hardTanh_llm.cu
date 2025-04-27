#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int totalThreads = gridDim.x * blockDim.x;
    
    // Use stride loop to ensure entire input is processed
    for (int i = tid; i < size; i += totalThreads) {
        float inputVal = in[i];
        // Use fminf and fmaxf to clamp the value
        out[i] = fminf(fmaxf(inputVal, min_val), max_val);
    }
}