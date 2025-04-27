#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void hardTanh(float* in, float* out, float min_val, float max_val, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread index calculation for readability
    int stride = blockDim.x * gridDim.x; // Reorder for consistency
    for (int i = tid; i < size; i += stride) { // Iterate over all elements with stride
        float val = in[i]; // Read input once to register
        out[i] = (val < min_val) ? min_val : (val > max_val ? max_val : val); // Use ternary operator efficiently
    }
}