#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *ic, const int *ia, const int *ib)
{
    int i = threadIdx.x;
    int b = blockIdx.x;
    int bd = blockDim.x;
    int gd = gridDim.x;

    // Removed unnecessary __syncthreads() as it has no effect here
    // Reduced printf output for performance
    if (i == 0) {
        printf("G[%d] B[%d]  t[%d]\n", gd, bd, b);
    }

    // Example computation based on function name
    int index = b * bd + i;
    ic[index] = ia[index] + ib[index];
}