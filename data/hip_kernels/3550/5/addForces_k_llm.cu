#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    // Cache thread indices to enhance readability
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    // Compute the correct memory address with pitched memory access
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;

    // Load memory to register for fast access
    float2 vterm = *fj;
    tx -= r; 
    ty -= r;
    
    // Reduce redundant computations by precalculating squares
    float txx2 = tx * tx;
    float tyy2 = ty * ty;
    float s = 1.f / (1.f + txx2 * txx2 + tyy2 * tyy2);
    
    // Update values using shared memory for faster read and write (if applicable)
    vterm.x += s * fx;
    vterm.y += s * fy;
    
    // Store the result back to the global memory
    *fj = vterm;
}