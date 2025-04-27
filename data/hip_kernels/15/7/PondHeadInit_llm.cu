#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PondHeadInit(double *ph, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    for (; tid < size; tid += stride) { // Use for-loop for potentially better compiler optimization
        ph[tid] = psi_min; // Set value using coalesced memory access pattern
    }
}