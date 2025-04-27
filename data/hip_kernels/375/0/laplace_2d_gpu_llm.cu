#include "hip/hip_runtime.h"
#include "includes.h"

int Nx, Ny, npts;
int *active;

__global__ void laplace_2d_gpu(double *w, double *v, const int nx, const int ny)
{
    // Calculate global indices
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Ensure processing only inner points
    if (ix > 0 && ix < (nx + 1) && iy > 0 && iy < (ny + 1)) 
    {
        // Optimize index calculation by reducing multiplications
        unsigned int idx = iy * (nx + 2) + ix;
        
        // Laplace calculation
        w[idx] = 4.0 * v[idx] - (v[idx - 1] + v[idx + 1] + v[idx - (nx + 2)] + v[idx + (nx + 2)]);
    }
}