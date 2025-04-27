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

// synchronize blocks
__global__ void copy(int nx, int ny, int nz, Real *in, Real *out) {
    int tj = threadIdx.x;

    int jj = (blockIdx.y * nx * ny / 4 + blockIdx.x * nx / 2);
    int jj1 = (blockIdx.y * nx * ny + blockIdx.x * nx);

    // Coalesce global memory access by using aligned indexing.
    if (tj < TILE_DIM) {
        out[jj + tj] = in[jj1 + tj];
    }
}