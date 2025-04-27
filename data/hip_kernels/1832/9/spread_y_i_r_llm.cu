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
__global__ void spread_y_i_r(Real* src, Real* dst)
{
    // Compute unique thread ID
    unsigned int total_threads_per_row = gridDim.x * blockDim.x;
    unsigned int row_offset = blockIdx.y * total_threads_per_row;
    unsigned int tid = row_offset + blockIdx.x * blockDim.x + threadIdx.x;

    unsigned int src_tid = tid * 2; // use stride for src as per original logic

    // Load and store
    Real res = src[src_tid];
    dst[tid] = res;
}