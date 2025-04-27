#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, double *node_weight, int *neighbor, int *neighbor_start, double *neighbor_accum_weight_result, double *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    if (x < nhub) {
        int nid = hub[x];
        double sum = 0.0;

        // Use shared memory to cache node weights, reducing global memory access
        extern __shared__ double shared_node_weight[];
        
        int start = neighbor_start[nid];
        int end = neighbor_start[nid + 1];
        
        for (int eid = start; eid < end; eid++) {
            // Cache node_weight in shared memory if not cached yet
            if (threadIdx.x < end - start) {
                shared_node_weight[threadIdx.x] = node_weight[neighbor[eid]];
            }
            __syncthreads();

            sum += shared_node_weight[threadIdx.x];
            neighbor_accum_weight_result[eid] = sum;

            __syncthreads();
        }

        sum_weight_result[nid] = sum;
    }
}