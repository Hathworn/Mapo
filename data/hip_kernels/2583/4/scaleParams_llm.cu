#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{

}

__global__ void scaleParams(int N, int M, float c, float *Mat, float *F)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Check indices once to improve readability and reduce code duplication
    if (i < N && j < M)
    {
        int index = j * N + i; // Move index calculation inside the if condition
        float s = __saturatef(__fdividef(c, __fsqrt_rn(F[i])));
        Mat[index] = __fmul_rn(Mat[index], s);
    }
}