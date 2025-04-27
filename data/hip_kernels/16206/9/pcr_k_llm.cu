#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pcr_k(float* a, float* b, float* c, float* y, int n) {
    // Identifies the thread working within a group
    int tidx = threadIdx.x % n;
    // Identifies the data concerned by the computations
    int Qt = threadIdx.x / n;
    // The global memory access index
    int gb_index_x = Qt + blockIdx.x * (blockDim.x / n);

    // Shared memory
    extern __shared__ float sAds[];

    // Optimized memory calculations
    int nt = 5 * Qt * n;
    float* sa = &sAds[nt];
    float* sb = &sa[n];
    float* sc = &sb[n];
    float* sy = &sc[n];
    int* sl = (int*)&sy[n];

    // Save into shared memory
    sa[tidx] = a[gb_index_x * n + tidx];
    sb[tidx] = b[gb_index_x * n + tidx];
    sc[tidx] = c[gb_index_x * n + tidx];
    sy[tidx] = y[gb_index_x * n + tidx];
    sl[tidx] = tidx;
    __syncthreads();

    // Left/Right indices of the reduction
    int tL = max(tidx - 1, 0); // Use max to simplify boundary condition
    int tR = min(tidx + 1, n - 1); // Use min to simplify boundary condition

    // Local variables
    float aL, bL, cL, yL, aLp, bLp, cLp, yLp;

    for (int i = 0; i < (int)log2f((float)n) + 1; i++) {
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
            float temp1 = aL / bLp;
            bL -= cLp * temp1;
            yL -= yLp * temp1;
            aL = -aLp * temp1;
        }

        aLp = sa[tR];
        bLp = sb[tR];
        cLp = sc[tR];
        float temp2 = cL / bLp;
        if (fabsf(aLp) > EPS) {
            yLp = sy[tR];
            bL -= aLp * temp2;
            yL -= yLp * temp2;
            cL = -cLp * temp2;
        }
        __syncthreads();
        // Permutation phase
        if (i < (int)log2f((float)n)) {
            sa[d] = aL;
            sb[d] = bL;
            sc[d] = cL;
            sy[d] = yL;
            sl[d] = sl[tidx]; // Simplified permutation
            __syncthreads();
        }
    }

    sy[tidx] = yL / bL;
    __syncthreads();
    y[gb_index_x * n + sl[tidx]] = sy[tidx];
}