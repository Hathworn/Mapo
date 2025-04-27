#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pcr_k(float a, float b, float c, float* y, int n) {
    // Identifies the thread working within a group
    int tidx = threadIdx.x % n;
    // Identifies the data concerned by the computations
    int Qt = threadIdx.x / n;
    // The global memory access index
    int gb_index_x = Qt + blockIdx.x * (blockDim.x / n);

    // Local integers
    int i, nt, lL, d, tL, tR;
    // Local floats
    float aL, bL, cL, yL, aLp, bLp, cLp, yLp;

    // Shared memory
    extern __shared__ float sAds[];

    nt = 5 * Qt * n;
    d = (n / 2 + (n % 2)) * (tidx % 2) + tidx / 2;
    float* sa = (float*)&sAds[nt];
    float* sb = (float*)&sa[n];
    float* sc = (float*)&sb[n];
    float* sy = (float*)&sc[n];
    int* sl = (int*)&sy[n];

    // Load data into shared memory
    sa[tidx] = a;
    sb[tidx] = b;
    sc[tidx] = c;
    sy[tidx] = y[gb_index_x * n + tidx];
    sl[tidx] = tidx;
    __syncthreads();

    // Left/Right indices of the reduction
    tL = max(tidx - 1, 0); // Ensure non-negative left index
    tR = min(tidx + 1, n - 1); // Ensure the right index doesn't exceed bounds

    for (i = 0; i < (int)log2f((float)n) + 1; i++) {
        lL = sl[tidx];
        aL = sa[tidx];
        bL = sb[tidx];
        cL = sc[tidx];
        yL = sy[tidx];

        bLp = sb[tL];
        // Reduction phase
        if (fabsf(aL) > EPS) {
            aLp = sa[tL];
            cLp = sc[tL];
            yLp = sy[tL];

            bL -= aL * cL / bLp;
            yL -= aL * yLp / bLp;
            aL = -aL * aLp / bLp;
        }

        aLp = sa[tR];
        bLp = sb[tR];
        cLp = sc[tR];
        if (fabsf(aLp) > EPS) {
            yLp = sy[tR];
            bL -= cLp * aLp / bLp;
            yL -= cLp * yLp / bLp;
            cL = -cL * cLp / bLp;
        }
        __syncthreads();
        
        // Permutation phase
        if (i < (int)log2f((float)n)) {
            sa[d] = aL;
            sb[d] = bL;
            sc[d] = cL;
            sy[d] = yL;
            sl[d] = lL;
            __syncthreads();
        }
    }

    sy[tidx] = yL / bL;
    __syncthreads();
    y[gb_index_x * n + sl[tidx]] = sy[tidx];
}