#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pnpoly_cnGPU(char *cs, const float *px, const float *py, const float *vx, const float *vy, int npoint, int nvert)
{
    extern __shared__ float shared_mem[]; // Use shared memory for vertices only
    float *tvx = shared_mem;
    float *tvy = &shared_mem[nvert];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load vertices into shared memory only once, by the first thread
    if (threadIdx.x < nvert) {
        tvx[threadIdx.x] = vx[threadIdx.x];
        tvy[threadIdx.x] = vy[threadIdx.x];
    }

    __syncthreads();

    if (i < npoint) {
        int j, k, c = 0;
        
        for (j = 0, k = nvert - 1; j < nvert; k = j++) {
            if (((tvy[j] > py[i]) != (tvy[k] > py[i])) && 
                (px[i] < (tvx[k] - tvx[j]) * (py[i] - tvy[j]) / (tvy[k] - tvy[j]) + tvx[j])) 
            {
                c = !c;
            }
        }
        cs[i] = c & 1;
    }
}