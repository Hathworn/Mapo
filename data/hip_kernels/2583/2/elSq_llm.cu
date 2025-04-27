#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{

}

__global__ void elSq(int N, int M, float *Mat)
{
    // Calculate global thread index for single dimension access
    int idx = blockIdx.y * blockDim.y * N + blockIdx.x * blockDim.x + threadIdx.y * N + threadIdx.x;

    // Guard against out-of-bounds and perform element-wise squaring
    if (threadIdx.x + blockIdx.x * blockDim.x < N && threadIdx.y + blockIdx.y * blockDim.y < M)
    {
        Mat[idx] = __fmul_rn(Mat[idx], Mat[idx]);
    }
}