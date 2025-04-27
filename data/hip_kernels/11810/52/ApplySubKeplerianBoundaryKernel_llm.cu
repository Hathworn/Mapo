```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ApplySubKeplerianBoundaryKernel(double *VthetaInt, double *Rmed, double OmegaFrame, int nsec, int nrad, double VKepIn, double VKepOut)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;

    // Check if thread index is within bounds for more concise range checking
    if (j < nsec) {
        // Process both the first and last radial indices in a single kernel call for better efficiency
        VthetaInt[j] = VKepIn - Rmed[0] * OmegaFrame;                              // i = 0, streamline
        VthetaInt[(nrad - 1) * nsec + j] = VKepOut - Rmed[nrad - 1] * OmegaFrame;  // i = nrad - 1, streamline
    }
}