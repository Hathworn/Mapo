#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    // Calculate the global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for potential performance improvement
    for (int i = tid; i < size; i += stride) {
        float current_in_x = in_x[i];
        if (inplace) {
            if (current_in_x < min_val || current_in_x > max_val) 
                in_d[i] = 0;
        } else {
            if (current_in_x >= min_val && current_in_x <= max_val) 
                in_d[i] += out_d[i];
        }
    }
}