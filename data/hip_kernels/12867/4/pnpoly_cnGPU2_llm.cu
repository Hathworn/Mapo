#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pnpoly_cnGPU2(const float *px, const float *py, const float *vx, const float *vy, char* cs, int npoint, int nvert)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < npoint) {
        float tpx = px[i]; // Use register variable for tpx
        float tpy = py[i]; // Use register variable for tpy
        int c = 0;

        // Unroll loop for better performance
        #pragma unroll 
        for (int j = 0, k = nvert - 1; j < nvert; k = j++) {
            bool cond1 = (vy[j] > tpy) != (vy[k] > tpy);
            bool cond2 = tpx < (vx[k] - vx[j]) * (tpy - vy[j]) / (vy[k] - vy[j]) + vx[j];
            if (cond1 && cond2)
                c = !c;
        }

        cs[i] = c & 1;
    }
}