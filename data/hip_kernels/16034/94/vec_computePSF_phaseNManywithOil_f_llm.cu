#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_computePSF_phaseNManywithOil_f(int n, int sizePart, int sizeTot, float *kx, float *ky, float *kz, float *kz_is_imag, float *kz_oil, float *kz_oil_is_imag, float *pupil, float *phase, float *position, int *sparseIndexEvenDisk, int *sparseIndexOddDisk, float *fft, int many) {
    // Calculate global index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    if (id < n) {
        // Compute indices based on partition size
        int u = id / sizePart;
        int p = id % sizePart;

        // Pre-compute common term
        float z = kx[p] * position[u] + ky[p] * position[u + many] + phase[p];

        // Calculate x and y values
        float x = z + kz[p] * position[u + 2 * many] - kz_oil[p] * position[u + 3 * many];
        float y = z + kz[p] * position[u + 2 * many] * kz_is_imag[p] - kz_oil[p] * position[u + 3 * many] * kz_oil_is_imag[p];

        // Compute FFT values
        fft[sparseIndexEvenDisk[p] + u * sizeTot] = pupil[p] * cosf(x); // Use cosf for float efficiency
        fft[sparseIndexOddDisk[p] + u * sizeTot] = pupil[p] * sinf(y);  // Use sinf for float efficiency
    }
}