#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX2F(i,j,ld) ((((j)-1)*(ld))+((i)-1))

#define BLOCK1 64
#define BLOCK1X    64
#define BLOCK1Y    8
#define BLOCK2X   512
#define BLOCK2Y   1

__global__ void update(float* Q, float* R, int m, int n, int k)
{
    __shared__ float RK[BLOCK2Y];
    __shared__ float QK[BLOCK2X];

    int tid1 = threadIdx.x;
    int tid2 = threadIdx.y;

    int j = blockIdx.y * BLOCK2Y + tid2 + k + 1;

    if (j < k + 1 || j > n) return;

    if (tid1 == 0) {
        RK[tid2] = R[IDX2F(k, j, n)];
    }

    // Improve data reuse by loading QK outside the loop
    if (tid2 == 0 && tid1 < m) {
        QK[tid1] = Q[IDX2F(tid1 + 1, k, m)];
    }

    __syncthreads();

    // Unroll loop for better performance
    for (int i = tid1 + 1; i <= m; i += BLOCK2X) {
        Q[IDX2F(i, j, m)] -= QK[tid1] * RK[tid2];
    }
}