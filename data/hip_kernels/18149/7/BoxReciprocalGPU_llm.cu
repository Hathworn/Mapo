#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BoxReciprocalGPU(double *gpu_prefact, double *gpu_sumRnew, double *gpu_sumInew, double *gpu_energyRecip, int imageSize)
{
    // Calculate the global thread ID
    int threadID = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure that threadID is within the bounds to prevent out-of-bounds access
    if(threadID < imageSize) {
        // Optimize by storing values in registers
        double sumR = gpu_sumRnew[threadID];
        double sumI = gpu_sumInew[threadID];
        double prefact = gpu_prefact[threadID];
        
        // Compute energy using values in registers for potential faster access
        gpu_energyRecip[threadID] = (sumR * sumR + sumI * sumI) * prefact;
    }
}