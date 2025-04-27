#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeResidualsKernel(double *VthetaRes, double *VMed, int nsec, int nrad, double *Vtheta) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread indices are within range
    if (i < nrad && j < nsec) {
        int idx = i * nsec + j; // Pre-compute index for efficiency
        VthetaRes[idx] = Vtheta[idx] - VMed[i]; // Compute residual
    }
}