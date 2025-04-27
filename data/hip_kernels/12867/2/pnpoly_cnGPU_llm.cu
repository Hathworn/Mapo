#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pnpoly_cnGPU(const float *px, const float *py, const float *vx, const float *vy, char* cs, int npoint, int nvert)
{
    extern __shared__ float sharedMemory[]; // Use dynamic shared memory
    float *tvx = sharedMemory;
    float *tvy = sharedMemory + nvert;

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    for (int j = threadIdx.x; j < nvert; j += blockDim.x) {
        tvx[j] = vx[j];
        tvy[j] = vy[j];
    }
    __syncthreads(); // Ensure all vertices are loaded before proceeding

    if (i < npoint) {
        int j, k, c = 0;
        for (j = 0, k = nvert - 1; j < nvert; k = j++) {
            if (((tvy[j] > py[i]) != (tvy[k] > py[i])) &&
                (px[i] < (tvx[k] - tvx[j]) * (py[i] - tvy[j]) / (tvy[k] - tvy[j]) + tvx[j]))
                c = !c;
        }
        cs[i] = c & 1;
    }
}