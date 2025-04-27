#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_kernel(bool *mask, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x;

    // Ensure thread is not out-of-bounds and executes only for nodes with valid mask
    if (x < width && y < height && mask[nid]) {
        double sum = 0.0;
        int start = neighbor_start[nid];
        int end = min(neighbor_start[nid + 1], start + HUB_THREASHOLD + 1); // +1 because HUB_THREASHOLD is out degree

        // Use loop unrolling to increase performance
        for (int eid = start; eid < end; eid += 4) {
            if (eid < end) sum += node_weight[neighbor[eid]];
            if (eid + 1 < end) sum += node_weight[neighbor[eid + 1]];
            if (eid + 2 < end) sum += node_weight[neighbor[eid + 2]];
            if (eid + 3 < end) sum += node_weight[neighbor[eid + 3]];

            if (eid < end) neighbor_accum_weight_result[eid] = sum;
            if (eid + 1 < end) neighbor_accum_weight_result[eid + 1] = sum;
            if (eid + 2 < end) neighbor_accum_weight_result[eid + 2] = sum;
            if (eid + 3 < end) neighbor_accum_weight_result[eid + 3] = sum;
        }

        sum_weight_result[nid] = sum;
    }
}