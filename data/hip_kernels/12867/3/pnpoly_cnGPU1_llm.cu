#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pnpoly_cnGPU1(const float *px, const float *py, const float *vx, const float *vy, char* cs, int npoint, int nvert)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < npoint) {
        int j, k;
        char c = 0; // Use char instead of int for 'c' to save space
        float pyi = py[i], pxi = px[i]; // Cache repeated memory loads
        for (j = 0, k = nvert - 1; j < nvert; k = j++) {
            // Simplified condition checking
            bool cond = ((vy[j] > pyi) != (vy[k] > pyi)) && 
                        (pxi < (vx[k] - vx[j]) * (pyi - vy[j]) / (vy[k] - vy[j]) + vx[j]);
            if (cond) c = !c;
        }
        cs[i] = c;
    }
}