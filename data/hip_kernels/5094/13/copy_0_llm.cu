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

// synchronized blocks - optimized
__global__ void copy_0(int nx, int ny, int nz, Real *in, Real *out) {
    int tj = threadIdx.x + blockIdx.x * blockDim.x; // Simplify computation by including blockIdx.x
    int index_in = blockIdx.y * nx * ny / 4 + tj; // Single index for input
    int index_out = (blockIdx.y + nz / 2) * nx * ny + tj + ny / 2 * nx; // Single index for output

    // Perform memory access, assuming boundaries are correctly managed
    if (tj < nx * ny / 4) {
        out[index_out] = in[index_in];
    }
}