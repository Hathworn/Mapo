#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define HUB_BLOCK_SIZE 32
#define TRANSITION_PROB 0.02 * 0.1

__global__ void find_all_sums_kernel(bool *mask, double *node_weight, int *neighbor, int *neighbor_start, double *sum_weight_result, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x; // thread_index is node id

    // Check if the current thread is within bounds
    if (x < width && y < height && mask[nid]) {
        double sum = 0.0;
        
        // Prefetch neighbor start indices
        int start = neighbor_start[nid];
        int end = neighbor_start[nid + 1];

        // Clamp end for threshold and loop improvement
        int clamped_end = min(end, start + HUB_THREASHOLD + 1);
        
        for (int eid = start; eid < clamped_end; eid++) {
            // Accumulate weights of neighbors
            sum += node_weight[neighbor[eid]];
        }
        
        // Store computed sum in result array
        sum_weight_result[nid] = sum;
    }
}