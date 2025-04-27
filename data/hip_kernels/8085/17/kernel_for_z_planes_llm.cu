#include "hip/hip_runtime.h"
#include "includes.h"

#define OUTSIDE_1 1

__device__ void Device_FloodFillZPlane(int zPlane, int L, int M, int N, unsigned char* vol)
{
    long idx, idxS, idxN, ts;
    bool anyChange = false;
    int x, y;

    ts = L * M * N;
    idx = zPlane * L * M;
    vol[idx] = OUTSIDE_1;

    anyChange = true;
    while(anyChange) {
        anyChange = false;
        // loop from left to right and top to bottom
        for(x = 0; x < L; x++) {
            for(y = 0; y < M; y++) {
                idxS = idx + y * L + x;
                if(vol[idxS] == OUTSIDE_1) {
                    idxN = idxS + L;
                    if((idxN < ts) && (vol[idxN] == 0)) {
                        vol[idxN] = OUTSIDE_1;
                        anyChange = true;
                    }
                    
                    idxN = idxS - L;
                    if((idxN >= 0) && (vol[idxN] == 0)) {
                        vol[idxN] = OUTSIDE_1;
                        anyChange = true;
                    }
                    
                    idxN = idxS + 1;
                    if((idxN < ts) && (vol[idxN] == 0)) {
                        vol[idxN] = OUTSIDE_1;
                        anyChange = true;
                    }
                    
                    idxN = idxS - 1;
                    if((idxN >= 0) && (vol[idxN] == 0)) {
                        vol[idxN] = OUTSIDE_1;
                        anyChange = true;
                    }
                }
            }
        }

        if(anyChange) {
            anyChange = false;
            // loop from right to left and bottom to top
            for(x = L - 1; x >= 0; x--) {
                for(y = M - 1; y >= 0; y--) {
                    idxS = idx + y * L + x;
                    if(vol[idxS] == OUTSIDE_1) {
                        idxN = idxS + L;
                        if((idxN < ts) && (vol[idxN] == 0)) {
                            vol[idxN] = OUTSIDE_1;
                            anyChange = true;
                        }
                        
                        idxN = idxS - L;
                        if((idxN >= 0) && (vol[idxN] == 0)) {
                            vol[idxN] = OUTSIDE_1;
                            anyChange = true;
                        }
                        
                        idxN = idxS + 1;
                        if((idxN < ts) && (vol[idxN] == 0)) {
                            vol[idxN] = OUTSIDE_1;
                            anyChange = true;
                        }
                        
                        idxN = idxS - 1;
                        if((idxN >= 0) && (vol[idxN] == 0)) {
                            vol[idxN] = OUTSIDE_1;
                            anyChange = true;
                        }
                    }
                }
            }
        }
    }
}

__global__ void kernel_for_z_planes(unsigned char *d_vol, int L, int M, int N)
{
    Device_FloodFillZPlane(threadIdx.x, L, M, N, d_vol);
}