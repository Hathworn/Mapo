#include "hip/hip_runtime.h"
#include "includes.h"

static unsigned int GRID_SIZE_N;
static unsigned int GRID_SIZE_4N;
static unsigned int MAX_STATE_VALUE;

__global__ static void cudaSumTIGammaKernel(unsigned char *tipX1, double *x2, double *tipVector, double *sumtable, int limit) {
    const int n = blockIdx.x * blockDim.x + threadIdx.x;
    if (n >= limit) return;

    const int i = n / 4, l = n % 4;
    double *left = &(tipVector[4 * tipX1[i]]);
    double *right = &(x2[16 * i + l * 4]);
    double *sum = &sumtable[i * 16 + l * 4];

    // Using local variables to minimize memory access latency
    double l0 = left[0], l1 = left[1], l2 = left[2], l3 = left[3];
    double r0 = right[0], r1 = right[1], r2 = right[2], r3 = right[3];

    // Unrolled loop for SIMD-like operations
    sum[0] = l0 * r0;
    sum[1] = l1 * r1;
    sum[2] = l2 * r2;
    sum[3] = l3 * r3;
}