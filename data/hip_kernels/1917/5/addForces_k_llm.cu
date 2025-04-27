#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate pointer to v based on tx, ty offsets
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Use registers for frequently accessed variables
    float2 vterm = *fj;
    int offsetTx = tx - r;
    int offsetTy = ty - r;
    
    // Pre-calculate offset squares
    float tx2 = offsetTx * offsetTx;
    float ty2 = offsetTy * offsetTy;
    
    // Calculate factor with pre-computed squares
    float s = 1.f / (1.f + tx2 * tx2 + ty2 * ty2);

    // Update vterm with computed values
    vterm.x += s * fx;
    vterm.y += s * fy;
    
    // Store result back
    *fj = vterm;
}