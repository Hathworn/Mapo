#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backProp2(float* layer1, float* dsyn2, float* label, float* out)
{
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    int k = blockDim.y * blockIdx.y + threadIdx.y;

    // Check boundary conditions to ensure safe memory access
    if (j < 10 && k < 10) {
        // Precompute frequently used term
        float out_k = out[k];
        float delta = (label[k] - out_k) * (out_k * (1.0 - out_k));

        // Factor out constant division
        float updateValue = delta * layer1[j] * 0.00166667f; // (60000.0/10.0) = 6000, (1/6000) = 0.00166667

        atomicAdd(&dsyn2[j * 10 + k], updateValue); // Use atomicAdd to safely update dsyn2
    }
}