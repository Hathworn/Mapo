#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void assign_add(float *target, const float *source) {
    target[0] += source[0];
    target[1] += source[1];
    target[2] += source[2];
}

__global__ void PoissonImageCloningIteration(const float *fixed, const float *mask, const float *source, float *target, const int wt, const int ht) {
    // Compute unique thread index
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Guard against accessing out-of-bound memory
    if (yt >= ht || xt >= wt) return;
    
    const int curt = wt * yt + xt;
    const int Nt = curt - wt;
    const int Wt = curt - 1;
    const int St = curt + wt;
    const int Et = curt + 1;
    
    float sum[3] = {};
    
    // Accumulate fixed vector
    assign_add(sum, &fixed[curt * 3]);
    
    // Accumulate source vectors selectively based on mask and bounds checking
    if (yt > 0 && mask[Nt] > 127.0f) {
        assign_add(sum, &source[Nt * 3]);
    }
    if (xt > 0 && mask[Wt] > 127.0f) {
        assign_add(sum, &source[Wt * 3]);
    }
    if (yt < ht-1 && mask[St] > 127.0f) {
        assign_add(sum, &source[St * 3]);
    }
    if (xt < wt-1 && mask[Et] > 127.0f) {
        assign_add(sum, &source[Et * 3]);
    }
    
    // Store computed average into target
    target[curt * 3 + 0] = sum[0] / 4;
    target[curt * 3 + 1] = sum[1] / 4;
    target[curt * 3 + 2] = sum[2] / 4;
}