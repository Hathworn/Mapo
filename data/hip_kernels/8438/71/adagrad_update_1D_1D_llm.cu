#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    float epsilon = 1e-8f;  // Use a variable for small constant
    for (; tid < size; tid += stride) {
        // Optimize by replacing repetitive indexing with variables
        float gradient = d[tid];
        gradient = max(-clip, min(clip, gradient));  // Use min/max for clipping
        m[tid] += gradient * gradient;
        x[tid] -= lr * gradient / sqrtf(m[tid] + epsilon);  // Use sqrtf for float
        d[tid] = 0.0f;
    }
}