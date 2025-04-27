#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    // Calculate global thread ID for better memory access pattern
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Unroll loop for better performance
    for (int i = tid; i < size; i += stride) {
        float x = in_x[i]; // Avoid repeated global memory access
        if (inplace) {
            if (x < min_val || x > max_val) {
                in_d[i] = 0; // Prevent redundant operations
            }
        } else {
            if (x >= min_val && x <= max_val) {
                in_d[i] += out_d[i]; // Avoid redundant operations
            }
        }
    }
}