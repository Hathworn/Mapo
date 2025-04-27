#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;

    if (gtidx < dx) {
        for (p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 pterm = part[fj];

                int xvi = __float2int_rd(pterm.x * dx); // Use faster float to int conversion
                int yvi = __float2int_rd(pterm.y * dy);

                float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

                // Use fmodf to simplify periodic boundary conditions
                pterm.x = fmodf(pterm.x + dt * vterm.x + 1.f, 1.f);
                pterm.y = fmodf(pterm.y + dt * vterm.y + 1.f, 1.f);

                part[fj] = pterm;
            }
        }
    }
}