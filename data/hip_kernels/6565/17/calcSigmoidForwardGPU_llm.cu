#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSigmoidForwardGPU(float *in, float *out, int elements)
{
    // Compute the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Process subsequent elements using stride to improve performance
    int stride = blockDim.x * gridDim.x;

    for (; id < elements; id += stride) {
        float v = in[id];
        v = 1.0f / (1.0f + expf(-v)); // Efficient use of expf for single-precision
        out[id] = v;
    }
}