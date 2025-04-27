#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void create_fpr_kernel(float* tpr, const int* unique_index, float* fpr, int num_selected, int num_total) {
    // Precompute constants outside of loop
    const float pos_cnt = tpr[num_selected - 1];
    const float neg_cnt = num_total - pos_cnt;
    const int gid_stride = blockDim.x * gridDim.x;

    // Calculate global thread index
    const int gid_base = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride-based loop for better parallelism
    for (int gid = gid_base; gid < num_selected; gid += gid_stride) {
        const float tp = tpr[gid];
        fpr[gid] = (1.0f + unique_index[gid] - tp) / neg_cnt;
        tpr[gid] = tp / pos_cnt;
    }
}