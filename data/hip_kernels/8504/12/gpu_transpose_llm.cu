#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_transpose(const float* src, float* dst, int colssrc, int colsdst, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int strd = blockDim.x * gridDim.x;

    for (int tid = idx; tid < n; tid += strd) { // Use loop increments by stride
        int cdst = tid % colsdst;
        int rdst = tid / colsdst;
        int rsrc = cdst;
        int csrc = rdst;
        dst[tid] = src[rsrc * colssrc + csrc];
    }
}