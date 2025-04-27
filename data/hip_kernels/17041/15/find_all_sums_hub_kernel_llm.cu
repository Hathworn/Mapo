#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we're within bounds and load hub index
    if (x < nhub) {
        int nid = hub[x];
        double sum = 0.0;
        
        // Use shared memory for thread-local sums optimization
        extern __shared__ double shared_sum[];
        shared_sum[threadIdx.x] = 0.0;

        // Prefetch neighbor_start values for coalesced global memory access
        int start = neighbor_start[nid];
        int end = neighbor_start[nid + 1];

        // Accumulate weights in local shared memory
        for (int eid = start; eid < end; eid++) {
            shared_sum[threadIdx.x] += node_weight[neighbor[eid]];
            neighbor_accum_weight_result[eid] = shared_sum[threadIdx.x];
        }
        
        // Write the final summed value to global memory
        sum_weight_result[nid] = shared_sum[threadIdx.x];
    }
}