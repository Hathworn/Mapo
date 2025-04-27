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
__global__ void copy_0(int nx, int ny, int nz, Real *in, Real *out) {
    // Calculate thread's unique index in a flattened grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate new positions based on grid and block indices
    int jj = (blockIdx.y * nx * ny / 4 + blockIdx.x * nx / 2) + idx;
    int jj1 = ((blockIdx.y + nz / 2) * nx * ny + (blockIdx.x + ny / 2) * nx) + idx;

    // Copy data from input to output
    out[jj1] = in[jj];
}