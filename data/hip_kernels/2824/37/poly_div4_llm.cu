#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div4(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        float x = poli[idx];
        float inv_x = 5.0f * __frcp_rn(x); // Fast reciprocal approximation
        poli[idx] = 5.0f + x * (7.0f - x * (9.0f + x * (5.0f + x * (5.0f + x)))) + inv_x;
    }
}