#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for adding forces
__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + (tx + spx);

    // Pre-calculate the repositioned indices
    int x = tx - r;
    int y = ty - r;
    
    // Optimize the computation of s using a single multiplication instead of multiple divisions
    float invDenom = 1.f / (1.f + x*x*x*x + y*y*y*y);
    
    // Merge arithmetic operations for efficiency
    fj->x += invDenom * fx;
    fj->y += invDenom * fy;
}