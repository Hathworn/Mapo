#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    
    // Calculate full thread and block width for loop unrolling and vectorized access
    int stride_x = blockDim.x * gridDim.x;
    int stride_y = lb * blockDim.y * gridDim.y;

    for (int x = gtidx; x < dx; x += stride_x) {
        for (int y = gtidy; y < dy; y += stride_y) {
            int fj = y * dx + x;
            float2 pterm = part[fj];

            int xvi = ((int)(pterm.x * dx));
            int yvi = ((int)(pterm.y * dy));
            float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

            pterm.x = fmodf(pterm.x + dt * vterm.x + 1.0f, 1.0f);  // Normalize and wrap
            pterm.y = fmodf(pterm.y + dt * vterm.y + 1.0f, 1.0f);  // Normalize and wrap

            part[fj] = pterm;
        }
    }
}