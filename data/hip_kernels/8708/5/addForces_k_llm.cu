#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    // Calculate the target address once and assign directly
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;
    
    float2 vterm = *fj;
    
    // Move subtraction out of multiply to reduce operations
    int offsetX = tx - r;
    int offsetY = ty - r;
    
    // Simplify the computation of s by combining power calculations
    float s = 1.f / (1.f + (offsetX * offsetX) * (offsetX * offsetX) + (offsetY * offsetY) * (offsetY * offsetY));
    
    // Inline operations for better performance
    vterm.x += s * fx;
    vterm.y += s * fy;
    
    *fj = vterm;
}