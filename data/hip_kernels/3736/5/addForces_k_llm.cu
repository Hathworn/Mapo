#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addForces_k(float2 *v, int dx, int dy, int spx, int spy, float fx, float fy, int r, size_t pitch) {

    // Calculate thread-specific indices
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    
    // Optimize memory access by calculating pointer position once
    float2 *fj = (float2*)((char*)v + (ty + spy) * pitch) + tx + spx;
    
    // Load data into a register to reduce memory latency
    float2 vterm = *fj;

    // Pre-calculate terms for improved performance
    int tx_shifted = tx - r;
    int ty_shifted = ty - r;
    float s = 1.f / (1.f + tx_shifted * tx_shifted * tx_shifted * tx_shifted + 
                          ty_shifted * ty_shifted * ty_shifted * ty_shifted);

    // Perform computation using registers
    vterm.x += s * fx;
    vterm.y += s * fy;

    // Store result back to the memory
    *fj = vterm;
}