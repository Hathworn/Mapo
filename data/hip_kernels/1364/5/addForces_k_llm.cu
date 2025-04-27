#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    // Move the pointer arithmetic outside the kernel loop to optimize memory access
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Minimize float2 packing/unpacking by directly operating within registers
    float2 vterm = *fj;

    // Precompute repetitive calculations to reduce instructions
    int tx_offset = tx - r;
    int ty_offset = ty - r;
    float tx2 = tx_offset * tx_offset;
    float ty2 = ty_offset * ty_offset;
    float s = 1.f / (1.f + tx2 * tx2 + ty2 * ty2);

    vterm.x += s * fx;
    vterm.y += s * fy;

    // Store result directly after operations
    *fj = vterm;
}