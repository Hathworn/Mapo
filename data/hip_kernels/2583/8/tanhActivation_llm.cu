#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"   // ensure function name to be exactly "eeTanh"
{
}

__global__ void tanhActivation(int N, int M, float *z)
{
    // Flattened index for 2D matrix
    int index = blockIdx.y * blockDim.y * N + blockIdx.x * blockDim.x + threadIdx.y * N + threadIdx.x;

    float c1 = __fdividef(2.0, 3.0);

    if (index < N * M) // Single check for index within bounds
    {
        float el = __fmul_rn(z[index], c1);
        if (el > 4.97)
        {
            z[index] = 1.7159;
        }
        else if (el < -4.97)
        {
            z[index] = -1.7159;
        }
        else
        {
            float x2 = __fmul_rn(el, el);
            float a = __fmul_rn(el, __fmaf_rn(x2, __fmaf_rn(x2, __fadd_rn(378.0, x2), 17235.0), 135135.0));
            float b = __fmaf_rn(x2, __fmaf_rn(x2, __fmaf_rn(x2, 28.0, 3150.0), 62370.0), 135135.0);
            float tanh = __fdividef(a, b);
            z[index] = __fmul_rn(1.7159, tanh);
        }
    }
}