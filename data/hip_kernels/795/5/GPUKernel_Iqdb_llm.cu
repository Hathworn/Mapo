#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPUKernel_Iqdb(int a, int v, int nQ, double *in, double *out) {

    // Optimized id calculation
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id >= v * v * nQ) return;

    int q = id % nQ;
    int d = (id / nQ) % v;
    int b = id / (nQ * v);

    if (b < a) return;

    int id2 = (b - a) * nQ * v + d * nQ + q;
    out[id2] = in[id];
}