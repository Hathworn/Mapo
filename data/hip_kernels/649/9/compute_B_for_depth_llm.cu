#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_B_for_depth(float* B, float* rho, float* Ns, int npix, int nchannels, int nimages) {
    // Optimize access using shared memory
    extern __shared__ float shared_rho[];
    
    int i = blockIdx.x*blockDim.x + threadIdx.x;
    int c = blockIdx.y*blockDim.y + threadIdx.y;
    
    if (c * npix + threadIdx.x < npix) {
        shared_rho[threadIdx.x] = rho[c*npix + threadIdx.x];
    }
    __syncthreads();

    if (i < npix * nimages) {
        B[c*npix*nimages + i] -= shared_rho[i % npix] * Ns[c*npix*nimages + i];
    }
}