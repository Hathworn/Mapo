#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BoxReciprocalGPU(double *gpu_prefact, double *gpu_sumRnew, double *gpu_sumInew, double *gpu_energyRecip, int imageSize)
{
    int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    if(threadID >= imageSize) return;

    // Use register variables for improved memory access speed
    double sumR = gpu_sumRnew[threadID];
    double sumI = gpu_sumInew[threadID];
    double prefact = gpu_prefact[threadID];

    // Compute energy in registers before writing to global memory
    gpu_energyRecip[threadID] = (sumR * sumR + sumI * sumI) * prefact;
}