#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int index = tid; index < size; index += stride) {  // Use index variable to improve code clarity
        float grad = d[index];
        grad = fmaxf(-clip, fminf(clip, grad));  // Use fmaxf and fminf for clipping
        m[index] += grad * grad;
        x[index] -= lr * grad / sqrtf(m[index] + 1e-8f);  // Use sqrtf for single precision
        d[index] = 0.0f;  // Set to zero immediately after the update
    }
}