#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_computePSF_phaseNMany(int n, int sizePart, int sizeTot, double *kx, double *ky, double *kz, double *pupil, double *phase, double* position, int *sparseIndexEvenDisk, int *sparseIndexOddDisk, double *fft, int many) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    // Process only within the relevant range
    if (id < n) {
        int u = id / sizePart;
        int p = id % sizePart;
        
        // Compute position indices upfront for brevity
        double posU = position[u];
        double posUM = position[u + many];
        double posU2M = position[u + 2 * many];
        
        // Compute phase using expanded expression
        double x = kx[p] * posU + ky[p] * posUM + kz[p] * posU2M + phase[p];

        // Cache common indices calculations
        int evenIdx = sparseIndexEvenDisk[p] + u * sizeTot;
        int oddIdx = sparseIndexOddDisk[p] + u * sizeTot;

        // Reduce redundant memory accesses by reducing pointer dereferencing
        double pupilP = pupil[p];
        fft[evenIdx] = pupilP * cos(x);
        fft[oddIdx] = pupilP * sin(x);
    }
}