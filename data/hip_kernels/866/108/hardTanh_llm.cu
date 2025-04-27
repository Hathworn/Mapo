#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    // Calculate the global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use a loop with stride to handle large arrays efficiently
    for (int i = tid; i < size; i += stride) {
        // Apply min-max bound directly
        float val = in[i];
        val = val < min_val ? min_val : val;
        val = val > max_val ? max_val : val;
        out[i] = val;
    }
}