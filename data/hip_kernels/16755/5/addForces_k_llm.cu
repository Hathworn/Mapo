#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Preload fj for reuse and reduce global memory access
    float2 vterm = *fj;

    // Compute tx and ty minus r
    int txr = tx - r; 
    int tyr = ty - r;

    // Compute scaling factor s using precomputed txr and tyr
    float s = 1.f / (1.f + txr*txr*txr*txr + tyr*tyr*tyr*tyr);
    
    // Apply calculated force
    vterm.x += s * fx;
    vterm.y += s * fy;

    // Write updated force back to global memory
    *fj = vterm;
}