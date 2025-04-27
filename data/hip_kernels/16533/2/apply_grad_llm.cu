#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void apply_grad(float *output, float *grad, const int N)
{
    const int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Use a stride loop to improve performance and maximize resource usage
    for (int i = idx; i < N; i += stride) {
        output[i] += dt * grad[i];
    }
}