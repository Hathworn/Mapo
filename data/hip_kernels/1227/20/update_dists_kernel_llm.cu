#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_dists_kernel(const int *beg_pos, const int *adj_list, const int *weights, bool *mask, int *dists, int *update_dists, const int num_vtx) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < num_vtx) {
        int current_dist = update_dists[tid];  // Cache 'update_dists[tid]' for reuse
        if (dists[tid] > current_dist) {
            dists[tid] = current_dist;         // Update 'dists' only if needed
            mask[tid] = true;                  // Mark the mask as true
        }
        update_dists[tid] = dists[tid];        // Update 'update_dists' with new distance
    }
}