#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    for (int i = tid; i < size; i += stride) {
        float x_val = in_x[i];
        // Avoid redundant memory accesses
        if (inplace) {
            in_d[i] = (x_val < min_val || x_val > max_val) ? 0 : in_d[i];
        } else {
            if (x_val >= min_val && x_val <= max_val) {
                in_d[i] += out_d[i];
            }
        }
    }
}