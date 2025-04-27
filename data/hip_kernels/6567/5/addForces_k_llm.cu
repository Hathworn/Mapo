#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    float2 vterm = *fj;
    int offsetX = tx - r;  // Compute offsetX once
    int offsetY = ty - r;  // Compute offsetY once
    float offsetX4 = offsetX * offsetX * offsetX * offsetX; // Precompute offsetX^4
    float offsetY4 = offsetY * offsetY * offsetY * offsetY; // Precompute offsetY^4
    float s = 1.f / (1.f + offsetX4 + offsetY4); // Use precomputed values

    vterm.x += s * fx;
    vterm.y += s * fy;
    *fj = vterm;
}