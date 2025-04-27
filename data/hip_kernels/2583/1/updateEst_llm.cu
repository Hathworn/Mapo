#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{

}

__global__ void updateEst(int N, int M, float beta2, float scale, float *PARAMS, float *AVG, float *EST)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < M)
    {
        int index = j * N + i;
        // Use fused multiply-add for better performance
        AVG[index] = __fmaf_rn((1.0f - beta2), PARAMS[index], __fmul_rn(beta2, AVG[index]));
        EST[index] = __fmul_rn(scale, AVG[index]);
    }
}