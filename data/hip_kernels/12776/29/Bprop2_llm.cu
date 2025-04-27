#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Bprop2(const float* out, const float* layer1, float* dsyn2, const int count, const float alpha)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y; // 256
    int j = blockIdx.x * blockDim.x + threadIdx.x; // 4
    
    // Load out[j] into a register
    float out_val = out[j];

    // Load layer1 value into a register
    float layer1_val = layer1[256*(count) + i];

    // Perform multiplication in a register
    float product = out_val * layer1_val * alpha;

    // Atomic addition to avoid race conditions
    atomicAdd(&dsyn2[i*4 + j], product);
}