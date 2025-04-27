#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for better performance
    for (; tid < size; tid += stride) {
        // Conditionally clip the gradient
        float grad = d[tid];
        if (grad > clip) grad = clip;
        else if (grad < -clip) grad = -clip;

        // Update the mem variable and compute new parameter value
        m[tid] += grad * grad;
        x[tid] -= lr * grad / sqrt(m[tid] + 1e-8f);

        // Reset the gradient
        d[tid] = 0;
    }
}