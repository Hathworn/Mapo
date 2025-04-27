#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void array_copy(float* a, float* c, int mx, int my, int mz, int sx, int sy, int sz, int ox, int oy, int oz) {
    int pnum = blockIdx.x * blockDim.x + threadIdx.x;  // thread index

    // Pre-calculate reusable constants
    int half_sx = sx / 2;
    int half_sy = sy / 2;

    int px = pnum % half_sx;  // x position of the complex number
    int py = pnum / half_sx;  // y position of the complex number

    // Exit if out of bounds
    if (px >= sx || py >= half_sy) return;

    int ids = 2 * (px + py * sx);  // source index
    int idd = 2 * ((ox + px) + (oy + py) * sx);  // destination index

    // Efficient in-register swap of values
    float tmpR = c[idd];
    float tmpI = c[idd + 1];

    c[idd] = a[ids];
    c[idd + 1] = a[ids + 1];

    a[ids] = tmpR;
    a[ids + 1] = tmpI;
}