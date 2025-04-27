#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_kernel(bool *mask, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x; // thread_index is node id

    // Ensure the node is within valid bounds and is active
    if (x < width && y < height && mask[nid]) {
        double sum = 0.0;
        int start = neighbor_start[nid];
        int end = min(neighbor_start[nid + 1], start + HUB_THREASHOLD + 1); // +1 because HUB_THREADHOLD is out degree

        // Accumulate neighbor weights
        for (int eid = start; eid < end; eid++) {
            sum += node_weight[neighbor[eid]];
            neighbor_accum_weight_result[eid] = sum;
        }
        sum_weight_result[nid] = sum;
    }
}