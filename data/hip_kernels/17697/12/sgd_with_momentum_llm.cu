#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function for SGD with momentum optimization
__global__ void sgd_with_momentum(float* w, const float* dw, float learning_rate, float momentum, float* v, unsigned int len) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < len) {
        // Update velocity and apply the momentum term
        float velocity = momentum * v[tid] + dw[tid];
        v[tid] = velocity;

        // Update weights with learning rate and current velocity
        w[tid] -= learning_rate * velocity;
    }
}