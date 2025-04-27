#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pnpoly_cnGPU1(const float *px, const float *py, const float *vx, const float *vy, char* cs, int npoint, int nvert)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < npoint) {
        int c = 0;
        // Use registers to store index calculations
        float px_i = px[i];
        float py_i = py[i];

        for (int j = 0, k = nvert - 1; j < nvert; k = j++) {
            // Simplified conditional logic for computation efficiency
            bool cond1 = (vy[j] > py_i) != (vy[k] > py_i);
            float vx_diff = vx[k] - vx[j];
            float vy_diff = vy[k] - vy[j];
            bool cond2 = px_i < (vx_diff * (py_i - vy[j]) / vy_diff + vx[j]);
            
            if (cond1 && cond2) {
                c = !c;
            }
        }
        
        cs[i] = c & 1;
    }
}