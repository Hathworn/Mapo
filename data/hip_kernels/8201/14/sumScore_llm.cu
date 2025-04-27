#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumScore(double *score, int full_size, int half_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Calculate the number of iterations needed based on half_size
    int iterations = (half_size + stride - 1) / stride;

    for (int i = 0; i < iterations; ++i) {
        int idx = i * stride + index;
        if (idx < half_size) {
            score[idx] += (idx + half_size < full_size) ? score[idx + half_size] : 0;
        }
    }
}