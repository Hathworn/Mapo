#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int GPUKernel_Position(int i, int j) {
    if (i < j) {
        return j * (j + 1) / 2 + i;
    }
    return i * (i + 1) / 2 + j;
}

__global__ void GPUKernel_VpVm_v2(int a, int b, int v, double *in, double *outp, double *outm) {
    int blockid = blockIdx.x * gridDim.y + blockIdx.y;
    int id = blockid * blockDim.x + threadIdx.x;
    int v2 = v * v;

    // Use shared memory to avoid repeated global memory reads
    __shared__ double s_in[1024];  // Adjust size based on actual needs
    if (id < v2) {
        s_in[threadIdx.x] = in[id];
    }
    __syncthreads();

    if (id >= v2) return;

    int d = id % v;
    int c = id / v;

    if (d > c) return;

    int cd = GPUKernel_Position(c, d);

    // Use shared memory for intermediate calculations
    outp[cd] = s_in[d * v + c] + s_in[c * v + d];
    outm[cd] = s_in[d * v + c] - s_in[c * v + d];
}