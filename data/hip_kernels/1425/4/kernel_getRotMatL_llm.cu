#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_getRotMatL(double* devRotm, double* devnR, int nR)
{
    extern __shared__ double matS[];

    double *mat = matS + threadIdx.x * 18;
    double *res = mat + 9;

    mat[0] = mat[4] = mat[8] = 0;
    mat[5] = devnR[threadIdx.x * 4 + 1];
    mat[6] = devnR[threadIdx.x * 4 + 2];
    mat[1] = devnR[threadIdx.x * 4 + 3];
    mat[7] = -mat[5];
    mat[2] = -mat[6];
    mat[3] = -mat[1];

    // Initialize res array with zero
    #pragma unroll
    for(int i = 0; i < 9; i++) res[i] = 0;

    // Matrix multiplication using manual unrolling
    #pragma unroll
    for (int i = 0; i < 3; i++)
    {
        #pragma unroll
        for (int j = 0; j < 3; j++)
        {
            #pragma unroll
            for (int k = 0; k < 3; k++)
            {
                res[i * 3 + j] += mat[i * 3 + k] * mat[k * 3 + j];
            }
        }
    }

    double scale = 2 * devnR[threadIdx.x * 4];
    #pragma unroll
    for (int n = 0; n < 9; n++)
    {
        mat[n] = mat[n] * scale + res[n] * 2;
    }

    mat[0] += 1;
    mat[4] += 1;
    mat[8] += 1;

    #pragma unroll
    for (int n = 0; n < 9; n++)
    {
        devRotm[threadIdx.x * 9 + n] = mat[n];
    }
}