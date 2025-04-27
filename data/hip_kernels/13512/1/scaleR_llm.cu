#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX2F(i,j,ld) ((((j)-1)*(ld))+((i)-1))

#define BLOCK1 64
#define BLOCK1X 64
#define BLOCK1Y 8
#define BLOCK2X 512
#define BLOCK2Y 1

__global__ void scaleR(float* Q, float* R, int m, int n, int k, float S)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + k;

    // Check within valid column range
    if (i <= n) {
        R[IDX2F(k, i, n)] *= S;  // Scale element
    }
}