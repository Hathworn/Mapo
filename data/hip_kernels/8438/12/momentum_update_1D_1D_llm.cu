#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < size; tid += stride) {
        // Load gradient into register
        float grad = d[tid];

        // Gradient clipping
        grad = fminf(fmaxf(grad, -gradClip), gradClip);

        // Momentum calculation
        float velocity = m[tid] * momentum + grad;

        // Update momentum
        m[tid] = velocity;

        // Nesterov update check
        if (nesterov) {
            // Adjust velocity if using Nesterov momentum
            velocity = grad + momentum * velocity;
        }

        // Update position with learning rate and velocity
        x[tid] -= learning_rate * velocity;

        // Reset gradient
        d[tid] = 0.0f;
    }
}