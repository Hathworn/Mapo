#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_One_wgrad_Add(float* _WgradTmp, float* Wgrad, float* w, int rows, int cols, int channels, float lambda)
{
    extern __shared__ float _sum[];
    int channel = blockIdx.x;
    int col     = blockIdx.y;
    int tid     = threadIdx.x;
    _sum[tid] = 0.0f;
    __syncthreads();

    // Use stride loop to reduce global memory access
    for(int i = tid; i < rows; i += blockDim.x){
        _sum[tid] += _WgradTmp[channel * rows * cols + i * cols + col];
    }
    __syncthreads();

    // Perform parallel reduction for improved performance
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        if (tid < offset) {
            _sum[tid] += _sum[tid + offset];
        }
        __syncthreads();
    }

    if(tid == 0) {
        Wgrad[channel * cols + col] = _sum[0] / rows + w[channel * cols + col] * lambda;
    }
}