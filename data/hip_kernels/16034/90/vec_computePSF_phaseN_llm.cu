#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_computePSF_phaseN (int n, double *kx, double *ky, double *kz, double *pupil, double *phase, double dx, double dy, double dz, int *sparseIndexEvenDisk, int *sparseIndexOddDisk, double *fft)
{
    // Calculate unique thread ID more efficiently
    int id = threadIdx.x + (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x;
    
    // Only process within bounds
    if (id < n) {
        double x = kx[id] * dx + ky[id] * dy + kz[id] * dz + phase[id];
        
        // Compute FFT contributions concurrently
        double cos_val = cos(x);
        double sin_val = sin(x);
        
        fft[sparseIndexEvenDisk[id]] = pupil[id] * cos_val;
        fft[sparseIndexOddDisk[id]] = pupil[id] * sin_val;
    }
}