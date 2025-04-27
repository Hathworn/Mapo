#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void apply_grad(float *output, float *grad, const int N)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x; // Improved stride calculation for threads

    for (int idx = pos; idx < N; idx += stride) { // More efficient loop based on stride
        output[idx] += dt * grad[idx];
    }
}