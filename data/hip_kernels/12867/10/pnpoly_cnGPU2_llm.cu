#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pnpoly_cnGPU2(const float *px, const float *py, const float *vx, const float *vy, char* cs, int npoint, int nvert)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use local variables instead of shared memory for per-thread data
    if (i < npoint) {
        float tpx = px[i];
        float tpy = py[i];
        int c = 0;
        
        // Loop unrolling may not be applied here directly due to variable nvert.
        for (int j = 0, k = nvert - 1; j < nvert; k = j++) {
            // Simplify condition by removing redundant calculations
            bool condition1 = (vy[j] > tpy) != (vy[k] > tpy);
            bool condition2 = tpx < (vx[k] - vx[j]) * (tpy - vy[j]) / (vy[k] - vy[j]) + vx[j];
            if (condition1 && condition2)
                c = !c;
        }
        // Store the result
        cs[i] = c & 1;
    }
}