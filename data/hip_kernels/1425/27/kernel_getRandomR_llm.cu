#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_getRandomR(double* dev_mat, double* dev_ramR)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    extern __shared__ double matS[];

    double *mat, *res;
    mat = matS + threadIdx.x * 18;
    res = mat + 9;

    // Initialize mat array using a loop for cleanliness
    for(int i = 0; i < 9; i++) {
        mat[i] = 0;
    }
    mat[5] = dev_ramR[tid * 4 + 1];
    mat[6] = dev_ramR[tid * 4 + 2];
    mat[1] = dev_ramR[tid * 4 + 3];
    mat[7] = -mat[5];
    mat[2] = -mat[6];
    mat[3] = -mat[1];

    // Initialize res array using a loop for cleanliness
    for(int i = 0; i < 9; i++) {
        res[i] = 0;
    }

    // Optimized matrix multiplication using single loop
    #pragma unroll
    for (int i = 0; i < 9; i++)
        res[i] = mat[i%3] * mat[i/3*3] + mat[i%3+3] * mat[i/3*3+1] + mat[i%3+6] * mat[i/3*3+2];

    double scale = 2 * dev_ramR[tid * 4];
    #pragma unroll
    for (int n = 0; n < 9; n++) {
        mat[n] = mat[n] * scale + res[n] * 2;
    }

    mat[0] += 1;
    mat[4] += 1;
    mat[8] += 1;

    #pragma unroll
    for (int n = 0; n < 9; n++) {
        dev_mat[tid * 9 + n] = mat[n];
    }
}