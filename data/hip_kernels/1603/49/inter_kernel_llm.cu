#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int i = idx + idy * gridDim.x * blockDim.x;

    // Calculate which block 'b' and within-block position 'j'
    if(i < (NX + NY) * B){
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Efficiently accessing with branch-free ternary operator
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}