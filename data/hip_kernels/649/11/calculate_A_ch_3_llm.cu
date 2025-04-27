#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_A_ch_3(float* rho, float* dz, float* s_a, int npix, int nchannels, int nimages, float* A_ch) {
    // Optimize thread indexing by merging grid dimensions into a single index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalElements = npix * nimages * nchannels;
    
    // Reduce bounds check to a single comparison
    if (idx < totalElements) {
        int c = idx / (npix * nimages);
        int j = (idx / npix) % nimages;
        int i = idx % npix;
        A_ch[idx] = (rho[c * npix + i] / dz[i]) * s_a[c * nimages * 3 + j];
    }
}