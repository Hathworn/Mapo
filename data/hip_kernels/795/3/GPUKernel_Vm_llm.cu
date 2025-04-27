```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int GPUKernel_Position(int i, int j) {
    return (i < j) ? j * (j + 1) / 2 + i : i * (i + 1) / 2 + j;
}

__global__ void GPUKernel_Vm(int a, int v, double* in, double* out) {

    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads outside valid range
    if (id >= (v * v * v)) return;
    
    int v2 = v * v; // Precompute to avoid recalculating
    int d = id % v;
    int b = (id / v) % v;
    int c = id / v2;

    if (b < a || d > c) return;

    int cd = GPUKernel_Position(c, d);
    int vtri = v * (v + 1) / 2;
    int offset = (b - a) * v2;
    
    out[(b - a) * vtri + cd] = in[offset + d * v + c] - in[offset + c * v + d];
}