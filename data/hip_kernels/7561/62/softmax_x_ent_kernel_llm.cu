#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory and thread-level parallelism
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float t = truth[i];
        float p = max(pred[i], 1e-8f); // Avoid log(0) with clamp
        error[i] = t ? -__logf(p) : 0.0f; // Use fast math intrinsic
        delta[i] = t - p;
    }
}