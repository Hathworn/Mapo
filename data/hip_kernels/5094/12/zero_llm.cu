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
__global__ void zero(int nx, int ny, int nz, Real *z) {
    int tj = threadIdx.x;
    int td = blockDim.x;
    int blockData = (nx * ny * nz) / (gridDim.x * gridDim.y);
    int jj = ((blockIdx.y) * gridDim.x + (blockIdx.x)) * blockData;

    // Calculate start index for each thread
    int start_idx = jj + tj;
    // Unroll the loop for better performance and to reduce loop overhead
    #pragma unroll
    for (int k = 0; k < blockData / td; ++k) {
        z[start_idx + k * td] = 0.0;
    }
}