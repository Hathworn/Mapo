#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;
    
    float2 pterm, vterm;

    // Check boundaries only once for efficiency
    if (gtidx < dx) {
        for (p = 0; p < lb && gtidy + p < dy; ++p) {
            int fi = gtidy + p;
            int fj = fi * dx + gtidx;

            // Direct access float2 array for particles using linear indexing
            pterm = part[fj];

            // Calculate velocity index accurately
            int xvi = min(max((int)(pterm.x * dx), 0), dx - 1);
            int yvi = min(max((int)(pterm.y * dy), 0), dy - 1);

            // Simplified velocity access
            vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

            // Efficient periodic boundary condition application
            pterm.x = fmodf(pterm.x + dt * vterm.x + 1.f, 1.f);
            pterm.y = fmodf(pterm.y + dt * vterm.y + 1.f, 1.f);

            part[fj] = pterm;
        }
    }
}