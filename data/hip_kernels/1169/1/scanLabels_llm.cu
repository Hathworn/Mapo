#include "hip/hip_runtime.h"
#include "includes.h"
/*
* CCL3D.cu
*/

#define CCL_BLOCK_SIZE_X 8
#define CCL_BLOCK_SIZE_Y 8
#define CCL_BLOCK_SIZE_Z 8

__device__ int d_isNotDone;

__global__ void scanLabels(int* labels, int w, int h, int d) {
    // Calculate the index only if within bounds
    const int x = blockIdx.x * CCL_BLOCK_SIZE_X + threadIdx.x;
    if (x >= w) return;
    const int y = blockIdx.y * CCL_BLOCK_SIZE_Y + threadIdx.y;
    if (y >= h) return;
    const int z = blockIdx.z * CCL_BLOCK_SIZE_Z + threadIdx.z;
    if (z >= d) return;
    const int index = (z*h + y)*w + x;

    const int Z1 = w * h;
    const int Y1 = w;

    int lcur = labels[index];
    if (lcur) {
        int lmin = index; // Initialize lmin to the current index to hold the possible minimum label

        // Use local variables to reduce repeated memory access
        int lne, pos;
        for (int Zdif = -Z1; Zdif <= Z1; Zdif += Z1) {
            for (int Ydif = -Y1; Ydif <= Y1; Ydif += Y1) {
                for (int Xdif = -1; Xdif <= 1; Xdif += 1) {
                    pos = index + Zdif + Ydif + Xdif;
                    if (pos >= 0 && pos < w*h*d) {
                        lne = labels[pos];
                        if (lne && lne < lmin) {
                            lmin = lne;
                        }
                    }
                }
            }
        }

        if (lmin < lcur) {
            // Ensure atomic update to avoid race condition
            atomicMin(&labels[lcur], lmin);
            d_isNotDone = 1;
        }
    }
}