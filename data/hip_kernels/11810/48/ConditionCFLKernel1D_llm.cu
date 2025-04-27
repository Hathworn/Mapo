```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ConditionCFLKernel1D (double *Rsup, double *Rinf, double *Rmed, int nrad, int nsec, double *Vtheta, double *Vmoy)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Check boundary condition for valid index
    if (i < nrad) {
        double sum = 0.0;  // Temporary variable to accumulate sum

        // Unroll loop for better performance
        for (int j = 0; j < nsec; j++) {
            sum += Vtheta[i * nsec + j];  // Accumulate values
        }
        
        Vmoy[i] = sum / (double)nsec;  // Calculate mean value
    }
}