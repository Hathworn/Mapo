#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_dists_kernel(const int * beg_pos, const int* adj_list, const int * weights, bool * mask, int* dists, int * update_dists, const int num_vtx) {

    int tid = blockIdx.x*blockDim.x + threadIdx.x;
    
    // Ensure we have valid threads to process vertices
    if (tid < num_vtx) {
    
        // Process only when the mask is true
        if (mask[tid] == true) {
            mask[tid] = false;  // Reset mask immediately
            
            int start = beg_pos[tid];
            int end = beg_pos[tid + 1];
            
            // Iterate over all edges of the current vertex
            for (int edge = start; edge < end; edge++) {
                int other = adj_list[edge];
                
                int new_dist = dists[tid] + weights[edge];
                
                // Atomic operation to safely update distance
                atomicMin(&update_dists[other], new_dist);
            }
        }
    }
}