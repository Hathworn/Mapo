#include "hip/hip_runtime.h"
#include "includes.h"

static unsigned int GRID_SIZE_N;
static unsigned int GRID_SIZE_4N;
static unsigned int MAX_STATE_VALUE;

__global__ static void cudaIIGammaKernel(double *extEV, double *x1, double *x2, double *x3, double *left, double *right) {
    __shared__ volatile double al[16], ar[16], x1px2[16];
    const int tid = threadIdx.z * 16 + threadIdx.y * 4 + threadIdx.x;
    const int offset = 16 * blockIdx.x + threadIdx.z * 4;
    const int lane = threadIdx.x;

    double local_al = x1[offset + lane] * left[tid];
    double local_ar = x2[offset + lane] * right[tid];

    // Reduce values within each warp
    local_al += __shfl_xor_sync(0xFFFFFFFF, local_al, 1);
    local_ar += __shfl_xor_sync(0xFFFFFFFF, local_ar, 1);

    if (lane == 0) {
        al[threadIdx.z * 4 + threadIdx.y] = local_al;
        ar[threadIdx.z * 4 + threadIdx.y] = local_ar;
        x1px2[threadIdx.z * 4 + threadIdx.y] = local_al * local_ar;
    }
    __syncthreads();

    // Calculate v using extended EV and store results in x3
    double val = x1px2[threadIdx.y + threadIdx.z * 4] * extEV[threadIdx.y * 4 + lane];

    // Reduce final results within each warp
    val += __shfl_down_sync(0xFFFFFFFF, val, 4);

    if (threadIdx.y == 0) {
        x3[offset + lane] = val;
    }
}