#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_One_Bgrad(float* _delta, float* bgrad, int rows, int cols, int channels)
{
    extern __shared__ float _sum[];
    int channel = blockIdx.x;
    int col     = blockIdx.y;
    int row     = threadIdx.x;
    float delta = _delta[channel * rows * cols + row * cols + col];
    _sum[row] = delta;
    __syncthreads();

    // Reduce sum using shared memory with fewer synchronizations
    for (int stride = rows >> 1; stride > 0; stride >>= 1) {
        if (row < stride) {
            _sum[row] += _sum[row + stride];
        }
        __syncthreads();
    }

    if (row == 0) {
        bgrad[channel * cols + col] = _sum[0] / rows;
    }
}