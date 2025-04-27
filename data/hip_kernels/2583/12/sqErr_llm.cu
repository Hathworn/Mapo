#include "hip/hip_runtime.h"
#include "includes.h"
// filename: eeTanh.cu

extern "C" // ensure function name to be exactly "eeTanh"
{

}

__global__ void sqErr(int N, int M, float *A, float *Y)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries to avoid out-of-bounds access
    if (i < N && j < M)
    {
        int index = j * N + i;  // Compute 1D index
        float tmp = __fsub_rn(A[index], Y[index]);  // Use fast subtraction
        A[index] = __fmul_rn(tmp, tmp);  // Use fast multiplication for squaring
    }
}