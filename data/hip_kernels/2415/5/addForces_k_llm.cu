#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Pre-compute often used values
    int tx_r = tx - r;
    int ty_r = ty - r;
    float tx_r4 = tx_r * tx_r * tx_r * tx_r;
    float ty_r4 = ty_r * ty_r * ty_r * ty_r;
    
    // Get pointer to target element in pitched memory
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;
    
    // Fetch current force value
    float2 vterm = *fj;
    
    // Compute scaling factor once
    float s = 1.f / (1.f + tx_r4 + ty_r4);
    
    // Update forces
    vterm.x += s * fx;
    vterm.y += s * fy;
    
    // Write back updated force
    *fj = vterm;
}