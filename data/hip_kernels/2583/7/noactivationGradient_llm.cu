#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize `noactivationGradient` kernel
__global__ void noactivationGradient(int N, int M, float *z, float *tanh_grad_z, int seed, float D) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    int index = j * N + i;
    if (i >= N || j >= M) return; // Boundary check at the beginning

    hiprandState_t state;
    hiprand_init((seed << 20) + index, 0, 0, &state);
    
    float F = hiprand_uniform(&state);
    float scaleFactor = __fdividef(1.0, __fsub_rn(1.0, D)); // Calculate scaleFactor once

    if (D != 0.0) {
        if (F < D) {
            z[index] = 0.0;
            tanh_grad_z[index] = 0.0;
        } else {
            tanh_grad_z[index] = scaleFactor;
            z[index] *= scaleFactor; // Use shorthand operator
        }
    } else {
        tanh_grad_z[index] = 1.0;
    }
}