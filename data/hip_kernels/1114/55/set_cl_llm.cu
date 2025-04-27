#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_cl(int *nnz_num, int *cl, int chunk, int pad_M)
{
    int c_size = pad_M / chunk;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i >= c_size) {
        return;
    }

    int offset = chunk * i;
    int max = 0;

    // Using a single loop condition to thread the chunk elements
    for (int j = 0; j < chunk; j++) {
        int length = nnz_num[offset + j];
        max = max > length ? max : length; // Optimize using a conditional expression
    }
    cl[i] = max;
}