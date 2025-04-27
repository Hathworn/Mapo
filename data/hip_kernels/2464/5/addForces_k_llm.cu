#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    // Calculate global thread coordinates
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    int ty = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure thread is within bounds
    if (tx >= dx || ty >= dy) return;

    // Calculate the position in memory
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Read the current value
    float2 vterm = *fj;

    // Apply force computation
    tx -= r; 
    ty -= r;
    float s = 1.f / (1.f + tx*tx*tx*tx + ty*ty*ty*ty);
    vterm.x += s * fx;
    vterm.y += s * fy;

    // Write the result back to memory
    *fj = vterm;
}