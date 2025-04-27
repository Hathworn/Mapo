#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcLoss(float *err, float *output, unsigned int Y, const int N)
{
    const int pos = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Iterate over the entire range using thread stride to maximize utilization
    for (int idx = pos; idx < N; idx += stride) {
        err[idx] = ((Y == idx ? 1.0f : 0.0f) - output[idx]);
    }
}