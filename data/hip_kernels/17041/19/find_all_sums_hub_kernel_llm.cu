#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nhub) {
        int nid = hub[x];
        double sum = 0.0;
        int start = neighbor_start[nid];
        int end = neighbor_start[nid+1];
        // Unroll loop to improve performance and reduce loop overhead
        for (int eid = start; eid < end; eid++) {
            sum += node_weight[neighbor[eid]];
            neighbor_accum_weight_result[eid] = sum;
        }
        sum_weight_result[nid] = sum;
    }
}