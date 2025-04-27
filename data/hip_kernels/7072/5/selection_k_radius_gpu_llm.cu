#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_k_radius_gpu(int b, int m, int k, float radius, const int* idx, const float* val, int* idx_out, float* val_out){
    int batch_index = blockIdx.x;
    int stride = batch_index * m * k;
    idx += stride;
    val += stride;
    idx_out += stride;
    val_out += stride;

    int i = blockIdx.y * blockDim.x + threadIdx.x;
    if (i < m) {  // Boundary check
        for (int j = 0; j < k; j++) {
            // Simplify condition and unified access for idx and val
            bool within_radius = val[i * k + j] < radius;
            idx_out[i * k + j] = idx[i * k + (within_radius ? j : 0)];
            val_out[i * k + j] = val[i * k + (within_radius ? j : 0)];
        }
    }
}