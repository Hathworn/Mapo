#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function: Compute PSF signal
__global__ void vec_computePSF_signalN2 (int n, double divide, int *sparseIndexEvenShiftOutput, int *sparseIndexOddShiftOutput, double *fft, int *sparseIndexEvenShiftOutputNext, int *sparseIndexOddShiftOutputNext, double *psffft)
{
    // Calculate unique thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (id < n)
    {
        // Load inputs from global memory
        int indexEven = sparseIndexEvenShiftOutput[id];
        int indexOdd = sparseIndexOddShiftOutput[id];

        // Division operation
        double x = fft[indexEven] / divide;
        double y = fft[indexOdd] / divide;

        // Compute output and store in global memory
        psffft[sparseIndexEvenShiftOutputNext[id]] = x * x + y * y;
        psffft[sparseIndexOddShiftOutputNext[id]] = 0.0;
    }
}