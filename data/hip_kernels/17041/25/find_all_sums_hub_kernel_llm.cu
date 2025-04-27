#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, float *node_weight, int *neighbor, int *neighbor_start, float *neighbor_accum_weight_result, float *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nhub) {
        int nid = hub[x];
        float sum = 0.0;

        // Use registers to minimize global memory access and avoid repeated computations
        int start = neighbor_start[nid];
        int end = neighbor_start[nid + 1];

        for (int eid = start; eid < end; eid++) {
            sum += node_weight[neighbor[eid]];
            neighbor_accum_weight_result[eid] = sum;
        }
        sum_weight_result[nid] = sum;
    }
}