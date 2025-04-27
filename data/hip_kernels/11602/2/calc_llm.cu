#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc(float *d_D, int n, int k) {
    __shared__ float s_d[4*3*256];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    int b_index = 4 * 3 * (threadIdx.x + blockDim.x * threadIdx.y);
    int istep = blockDim.x * gridDim.x, jstep = blockDim.y * gridDim.y;

    int l, m, v = 0;

    #pragma unroll
    for (l = 0; l < 2; l++)
    #pragma unroll
    for (m = 0; m < 2; m++) {
        int idx1 = (i + l * istep) + (j + m * jstep) * n;
        int idx2 = (i + l * istep) + k * n;
        int idx3 = k + (j + m * jstep) * n;

        s_d[b_index + 3 * v] = d_D[idx1];
        s_d[b_index + (3 * v + 1)] = d_D[idx2];
        s_d[b_index + (3 * v + 2)] = d_D[idx3];
        v++;
    }

    #pragma unroll
    for (v = 0; v < 4; v++) {
        float a = s_d[b_index + 3 * v];
        float b = s_d[b_index + (3 * v + 1)];
        float c = s_d[b_index + (3 * v + 2)];
        if (a > b + c) s_d[b_index + 3 * v] = b + c;
    }

    v = 0;
    #pragma unroll
    for (l = 0; l < 2; l++)
    #pragma unroll
    for (m = 0; m < 2; m++) {
        d_D[(i + l * istep) + (j + m * jstep) * n] = s_d[b_index + 3 * v];
        v++;
    }
}