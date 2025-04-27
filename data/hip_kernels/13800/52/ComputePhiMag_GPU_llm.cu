```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputePhiMag_GPU(float* phiR, float* phiI, float* phiMag, int numK) {
    int indexK = blockIdx.x * blockDim.x + threadIdx.x; // Utilize blockDim.x for more flexibility
    if (indexK < numK) {
        // Use local variables to avoid redundant memory accesses
        float real = phiR[indexK];
        float imag = phiI[indexK];
        phiMag[indexK] = real * real + imag * imag;
    }
}