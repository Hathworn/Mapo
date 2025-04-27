```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define CHECK_AND_SET(idxN) \
    if((idxN >= 0) && (idxN < ts) && \
    ((vol[idxN] == 0) || (vol[idxN] == OUTSIDE_1) || (vol[idxN] == OUTSIDE_2))) { \
        vol[idxN] = OUTSIDE_3; \
        anyChange = true; \
    }

__device__ void Device_FloodFillXPlane(int xPlane, int L, int M, int N, unsigned char* vol)
{
    long idx, idxS, idxN, ts;
    bool anyChange;
    int y, z;

    ts = L * M * N;
    idx = xPlane;

    // set point (0,0) to OUTSIDE_3
    vol[idx] = OUTSIDE_3;

    anyChange = true;
    while(anyChange) {
        anyChange = false;
        // loop from left to right and top to bottom
        for(y = 0; y < M; y++) {
            for(z = 0; z < N; z++) {
                idxS = z * L * M + L * y + idx;
                if(vol[idxS] == OUTSIDE_3) {
                    // check and set each neighbor
                    CHECK_AND_SET(idxS + L * M)
                    CHECK_AND_SET(idxS - L * M)
                    CHECK_AND_SET(idxS + L)
                    CHECK_AND_SET(idxS - L)
                }
            }
        }

        if(anyChange) {
            anyChange = false;
            // loop from bottom to top and right to left
            for(y = M - 1; y >= 0; y--) {
                for(z = N - 1; z >= 0; z--) {
                    idxS = z * L * M + L * y + idx;
                    if(vol[idxS] == OUTSIDE_3) {
                        CHECK_AND_SET(idxS + L * M)
                        CHECK_AND_SET(idxS - L * M)
                        CHECK_AND_SET(idxS + L)
                        CHECK_AND_SET(idxS - L)
                    }
                }
            }
        }
    }
}

__global__ void kernel_for_x_planes(unsigned char *d_vol, int L, int M, int N) 
{
    Device_FloodFillXPlane(threadIdx.x, L, M, N, d_vol);
}