#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ConditionCFLKernel2D3(double *newDT, double *DT2D, double *DT1D, double *Vmoy, double *invRmed, int *CFL, int nsec, int nrad, double DeltaT)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Restrict kernel execution to thread 0 to remove branch divergence
    if (j != 0) return;

    double newdt = newDT[1];
    // Use shared memory to reduce global memory access latency
    __shared__ double minVals[256];

    // Load values into shared memory for reduction
    for (int i = 2; i < nrad; i += blockDim.x) {
        if (threadIdx.x + i < nrad) {
            minVals[threadIdx.x] = newDT[threadIdx.x + i];
        } else {
            minVals[threadIdx.x] = newdt;
        }
        __syncthreads();

        // Parallel reduction in shared memory
        for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            __syncthreads();
            if (threadIdx.x < stride) {
                minVals[threadIdx.x] = min(minVals[threadIdx.x], minVals[threadIdx.x + stride]);
            }
        }
        __syncthreads();

        newdt = min(newdt, minVals[0]);
    }

    // Apply the same reduction method for DT1D
    for (int i = 0; i < nrad-1; i += blockDim.x) {
        if (threadIdx.x + i < nrad-1) {
            minVals[threadIdx.x] = DT1D[threadIdx.x + i];
        } else {
            minVals[threadIdx.x] = newdt;
        }
        __syncthreads();

        for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            __syncthreads();
            if (threadIdx.x < stride) {
                minVals[threadIdx.x] = min(minVals[threadIdx.x], minVals[threadIdx.x + stride]);
            }
        }
        __syncthreads();

        newdt = min(newdt, minVals[0]);
    }

    newdt = min(newdt, DeltaT);
    CFL[0] = (int)(ceil(DeltaT / newdt));
}