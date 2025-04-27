#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_all_sums_hub_kernel(int* hub, int nhub, double *node_weight, int *neighbor, int *neighbor_start, double *sum_weight_result) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    if (x < nhub) {
        int nid = hub[x];
        double sum = 0.0;

        // Use shared memory for node_weight array to improve memory access efficiency
        extern __shared__ double shared_node_weight[];
        for (int i = threadIdx.x; i < nhub; i += blockDim.x) {
            shared_node_weight[i] = node_weight[i];
        }
        __syncthreads();

        // Unroll loop to reduce loop overhead
        for (int eid = neighbor_start[nid]; eid < neighbor_start[nid+1]; eid += 4) {
            sum += shared_node_weight[neighbor[eid]];
            if (eid+1 < neighbor_start[nid+1]) sum += shared_node_weight[neighbor[eid+1]];
            if (eid+2 < neighbor_start[nid+1]) sum += shared_node_weight[neighbor[eid+2]];
            if (eid+3 < neighbor_start[nid+1]) sum += shared_node_weight[neighbor[eid+3]];
        }
        sum_weight_result[nid] = sum;
    }
}