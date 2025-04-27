```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define DOUBLE

#ifdef DOUBLE
#define Complex  hipfftDoubleComplex
#define Real double
#define Transform HIPFFT_Z2Z
#define TransformExec hipfftExecZ2Z
#else
#define Complex  hipfftComplex
#define Real float
#define Transform HIPFFT_C2C
#define TransformExec hipfftExecC2C
#endif

#define TILE_DIM  8

// Optimize thread indexing by using a single index calculation
__global__ void copy(int nx, int ny, int nz, Real *in, Real *out) {
    int tj = threadIdx.x;
    int jj = blockIdx.y * nx * ny / 4 + blockIdx.x * nx / 2 + tj;
    int jj1 = blockIdx.y * nx * ny + blockIdx.x * nx + tj;
    
    out[jj] = in[jj1];
}