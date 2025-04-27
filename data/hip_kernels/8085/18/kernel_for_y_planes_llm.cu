#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void Device_FloodFillYPlane(int yPlane, int L, int M, int N, unsigned char* vol)
{
    long idx, idxS, idxN, ts;
    bool anyChange = false;
    int x, z;

    ts = L * M * N;
    idx = yPlane * L;
    vol[idx] = OUTSIDE_2;

    anyChange = true;
    while (anyChange) {
        anyChange = false;

        // Optimizing loop from left to right and top to bottom
        // Merging both loops into a single pass
        for (x = 0; x < L; x++) {
            for (z = 0; z < N; z++) {
                idxS = z * L * M + idx + x;

                if (vol[idxS] == OUTSIDE_2) {
                    // Check neighbors
                    idxN = idxS + L * M;
                    if (idxN < ts && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                        vol[idxN] = OUTSIDE_2;
                        anyChange = true;
                    }

                    idxN = idxS - L * M;
                    if (idxN >= 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                        vol[idxN] = OUTSIDE_2;
                        anyChange = true;
                    }

                    idxN = idxS + 1;
                    if ((idxS + 1) % L != 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                        vol[idxN] = OUTSIDE_2;
                        anyChange = true;
                    }

                    idxN = idxS - 1;
                    if (idxS % L != 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                        vol[idxN] = OUTSIDE_2;
                        anyChange = true;
                    }
                }
            }
        }

        if (anyChange) {
            anyChange = false;

            // Optimizing loop from bottom to top and right to left
            // Merging both loops into a single pass
            for (x = L - 1; x >= 0; x--) {
                for (z = N - 1; z >= 0; z--) {
                    idxS = z * L * M + idx + x;

                    if (vol[idxS] == OUTSIDE_2) {
                        // Check neighbors
                        idxN = idxS + L * M;
                        if (idxN < ts && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                            vol[idxN] = OUTSIDE_2;
                            anyChange = true;
                        }

                        idxN = idxS - L * M;
                        if (idxN >= 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                            vol[idxN] = OUTSIDE_2;
                            anyChange = true;
                        }

                        idxN = idxS + 1;
                        if ((idxS + 1) % L != 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                            vol[idxN] = OUTSIDE_2;
                            anyChange = true;
                        }

                        idxN = idxS - 1;
                        if (idxS % L != 0 && (vol[idxN] == 0 || vol[idxN] == OUTSIDE_1)) {
                            vol[idxN] = OUTSIDE_2;
                            anyChange = true;
                        }
                    }
                }
            }
        }
    }
}

__global__ void kernel_for_y_planes(unsigned char *d_vol, int L, int M, int N)
{
    Device_FloodFillYPlane(threadIdx.x, L, M, N, d_vol);
}