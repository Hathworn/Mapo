#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    // Calculate global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Efficient loop unrolling with step count
    for (int i = tid; i < size; i += stride) {
        float x_val = in_x[i];
        if (inplace) {
            // Zero gradient if outside the range in inplace mode
            if (x_val < min_val || x_val > max_val) {
                in_d[i] = 0;
            }
        } else {
            // Accumulate gradient within range
            if (x_val >= min_val && x_val <= max_val) {
                in_d[i] += out_d[i];
            }
        }
    }
}