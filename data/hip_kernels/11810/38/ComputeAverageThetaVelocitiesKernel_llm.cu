#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeAverageThetaVelocitiesKernel(double *Vtheta, double *VMed, int nsec, int nrad)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for intermediate summation to improve memory access pattern
    extern __shared__ double sharedMoy[];
    
    if (i < nrad) {
        double moy = 0.0;
        for (int j = threadIdx.y; j < nsec; j += blockDim.y) {
            moy += Vtheta[i * nsec + j];
        }
        
        // Reduce within block to compute total moy for the segment
        sharedMoy[threadIdx.x] = moy;
        __syncthreads();
        
        if (threadIdx.x == 0) {
            moy = 0.0;
            for (int k = 0; k < blockDim.x; ++k) {
                moy += sharedMoy[k];
            }
            VMed[i] = moy / (double)nsec;
        }
    }
}