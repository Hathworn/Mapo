#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access pattern and reduce computations
__global__ void vec_computePSF_phaseNwithOil (int n, double  *kx, double  *ky, double  *kz,double  *kz_is_imag, double  *kz_oil,double  *kz_oil_is_imag, double  *pupil, double  *phase,double dx, double dy, double dz, double dz_oil, int *sparseIndexEvenDisk, int *sparseIndexOddDisk, double *fft) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;
    
    if (id < n) {
        // Precompute recurring values
        double kx_dx = kx[id] * dx;
        double ky_dy = ky[id] * dy;
        double z_phase = kx_dx + ky_dy + phase[id];
        double dz_component = kz[id] * dz;
        double dz_oil_component = kz_oil[id] * dz_oil;
        double pupil_val = pupil[id];
        
        // Compute x and y using precomputed values
        double x = z_phase + dz_component - dz_oil_component;
        double y = z_phase + dz_component * kz_is_imag[id] - dz_oil_component * kz_oil_is_imag[id];

        // Write results to the FFT array
        fft[sparseIndexEvenDisk[id]] = pupil_val * cos(x);
        fft[sparseIndexOddDisk[id]] = pupil_val * sin(y);
    }
}