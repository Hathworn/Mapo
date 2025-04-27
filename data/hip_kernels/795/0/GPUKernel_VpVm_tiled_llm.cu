```c++
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GPUKernel_VpVm_tiled(int a, int bstart, int bsize,int v,double * in,double * outp,double * outm) {

    int blockid = blockIdx.x * gridDim.y + blockIdx.y;
    int id      = blockid * blockDim.x + threadIdx.x;

    int v2 = v * v;

    if (id >= v2 * bsize) return; // Boundary condition

    // id: b * v2 + c * v + d
    int d = id % v;
    int c = (id / v) % v;
    int b = id / (v * v);

    if (d > c) return; // Skip the unnecessary computations

    if (b + bstart < a) return;

    int cd   = c * (c + 1) / 2 + d; // Map (c, d) to 1D array
    int vtri = v * (v + 1) / 2;
    int bv2  = b * v2;

    outp[b * vtri + cd] = in[bv2 + d * v + c] + in[id]; // Compute output for outp
    outm[b * vtri + cd] = in[bv2 + d * v + c] - in[id]; // Compute output for outm
}