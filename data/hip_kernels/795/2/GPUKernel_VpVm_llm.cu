#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int GPUKernel_Position(int i, int j) {
    if (i < j) {
        return j * (j + 1) / 2 + i;
    }
    return i * (i + 1) / 2 + j;
}

__global__ void GPUKernel_VpVm(int a, int v, double* in, double* outp, double* outm) {
    int blockid = blockIdx.x * gridDim.y + blockIdx.y;
    int id = blockid * blockDim.x + threadIdx.x;

    int v2 = v * v;

    // Use early exit to minimize work
    if (id >= v2 * v) return;

    int d = id % v;
    int b = (id - d) % (v2) / v;

    if (b < a) return;

    int bma = b - a;

    int c = (id - d - b * v) / (v2);

    if (d > c) return;

    int cd = GPUKernel_Position(c, d);
    int vtri = v * (v + 1) / 2;

    // Use temporary variables to avoid redundant calculations
    double in1 = in[bma * v2 + d * v + c];
    double in2 = in[bma * v2 + c * v + d];

    // Compute outputs directly
    outp[bma * vtri + cd] = in1 + in2;
    outm[bma * vtri + cd] = in1 - in2;
}