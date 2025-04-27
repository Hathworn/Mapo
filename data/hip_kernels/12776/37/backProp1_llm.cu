#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backProp1(float* in, float* dsyn1, float* layer1, float* syn2, float* label, float* out)
{
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    int k = blockDim.y * blockIdx.y + threadIdx.y;
    float error = 0.0;

    // Use shared memory for performance improvement
    __shared__ float shared_label[10];
    __shared__ float shared_out[10];

    if (j < 10) {
        shared_label[j] = label[j];
        shared_out[j] = out[j];
    }
    __syncthreads();

    #pragma unroll
    for (int l = 0; l < 10; ++l) {
        error += (shared_label[l] - shared_out[l]) * syn2[k * 10 + l];
    }

    // Precompute repeated term for efficiency
    float term = layer1[k] * (1 - layer1[k]);
    float delta = error * term;
    atomicAdd(&dsyn1[j * 128 + k], delta * in[j] / 6000.0);
}