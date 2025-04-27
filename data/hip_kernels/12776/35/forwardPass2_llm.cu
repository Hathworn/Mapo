#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardPass2(float* layer1, float* syn2, float* out)
{
    int l = blockDim.x * blockIdx.x + threadIdx.x;
    int Y = 128;
    int Z = 10;

    // Initialize the output element before accumulation
    float sum = 0.0f;

    // Use a register for the current index calculation
    #pragma unroll
    for (int j = 0; j < Y; ++j)
    {
        sum += layer1[j] * syn2[j * Z + l];
    }

    // Write back the computed value
    out[l] = 1.0f / (1.0f + exp(-sum));
}