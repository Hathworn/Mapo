#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    
    // Check if within domain bounds in X
    if (gtidx >= dx) return;
    
    float2 pterm, vterm;

    for (int p = 0; p < lb; p++) {
        int fi = gtidy + p;
        
        // Check if within domain bounds in Y
        if (fi >= dy) continue;
        
        int fj = fi * dx + gtidx;
        pterm = part[fj];
        
        int xvi = static_cast<int>(pterm.x * dx);
        int yvi = static_cast<int>(pterm.y * dy);
        vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

        // Update particle position and ensure it wraps correctly
        pterm.x = fmodf(pterm.x + dt * vterm.x + 1.f, 1.f);
        pterm.y = fmodf(pterm.y + dt * vterm.y + 1.f, 1.f);

        part[fj] = pterm;
    }
}