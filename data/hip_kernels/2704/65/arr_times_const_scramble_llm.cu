#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void arr_times_const_scramble(float *a, float b, float *c, int sx, int sy, int sz, int ox, int oy, int oz)
{
    int pnum = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    // Calculate x and y position in subarray
    int px = pnum % (sx / 2);
    int py = pnum / (sx / 2);

    // Check if the thread is within bounds
    if (px >= (sx / 2) || py >= (sy / 2)) return;

    // Compute source and destination indices
    int ids = 2 * (px + py * sx);
    int idd = 2 * ((ox + px) + (oy + py) * sx);

    // Swap values using temporary variables to enhance performance
    float tmpR = __ldg(&c[idd]);
    float tmpI = __ldg(&c[idd + 1]);
    c[idd] = __ldg(&a[ids]);
    c[idd + 1] = __ldg(&a[ids + 1]);
    a[ids] = tmpR;
    a[ids + 1] = tmpI;
}