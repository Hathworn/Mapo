#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define HUB_BLOCK_SIZE 32

#define TRANSITION_PROB 0.02 * 0.1

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, double *node_weight, int *neighbor, int *neighbor_start, double *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nhub) {
        int nid = hub[x];
        double sum = 0.0;
        
        // Use of register for frequently used neighbor_start[nid]
        int start = neighbor_start[nid];
        int end = neighbor_start[nid+1];
        
        // Using unrolling for loop to improve performance
        int eid;
        for (eid = start; eid < end - 4; eid += 4) {
            sum += node_weight[neighbor[eid]];
            sum += node_weight[neighbor[eid + 1]];
            sum += node_weight[neighbor[eid + 2]];
            sum += node_weight[neighbor[eid + 3]];
        }
        
        // Handle leftover iterations
        for (; eid < end; eid++) {
            sum += node_weight[neighbor[eid]];
        }
        
        sum_weight_result[nid] = sum;
    }
}