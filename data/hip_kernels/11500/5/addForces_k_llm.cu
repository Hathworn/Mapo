```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    float2 vterm = *fj;
    // Pre-calculate tx*tx and ty*ty to reduce redundant computation
    int tx_offset = tx - r;
    int ty_offset = ty - r;
    int tx_pow4 = tx_offset * tx_offset * tx_offset * tx_offset;
    int ty_pow4 = ty_offset * ty_offset * ty_offset * ty_offset;
    float s = 1.f / (1.f + tx_pow4 + ty_pow4);

    vterm.x += s * fx;
    vterm.y += s * fy;
    // Store the updated value back into global memory
    *fj = vterm;
}