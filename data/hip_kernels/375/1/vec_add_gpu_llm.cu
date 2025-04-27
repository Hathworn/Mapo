#include "hip/hip_runtime.h"
#include "includes.h"

/* Global variables available in all functions */
int Nx, Ny, npts;
int *active;

/* Optimize the kernel function */
__global__ void vec_add_gpu(double *sum, double *w, double a, double *v, const int nx, const int ny)
{
    // Calculate global index
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Check if within bounds and calculate index only if active
    if (ix > 0 && ix < (nx + 1) && iy > 0 && iy < (ny + 1))
    {
        unsigned int idx = iy * (nx + 2) + ix; // Optimize index calculation
        sum[idx] = w[idx] + a * v[idx]; // Perform addition
    }
}