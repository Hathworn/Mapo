#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_sssp_data(bool * d_mask, int* d_dists, int* d_update_dists, const int source, const int num_vtx) {
    // Calculate thread id
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Process only if tid is valid
    if (tid < num_vtx) {
        bool is_source = (source == tid);
        d_mask[tid] = is_source;
        int initial_dist = is_source ? 0 : INT_MAX;
        d_dists[tid] = initial_dist;
        d_update_dists[tid] = initial_dist;
    }
}