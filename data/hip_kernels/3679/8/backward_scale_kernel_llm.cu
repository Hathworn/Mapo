#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f; // Initialize sum as float

    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) { // Optimize loop to reduce divergence
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use parallel reduction for less contention
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    // Atomically update the scale_updates array
    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);
    }
}