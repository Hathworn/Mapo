#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void next_move_hub_kernel(int* hub, int nhub, int *rat_count, int *healthy_rat_count, int *exposed_rat_count, int *infectious_rat_count, double *node_weight, double *sum_weight_result, int *neighbor, int *neighbor_start, int width, int height, double batch_fraction) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize: Use shared memory to reduce global memory access latency
    __shared__ double shared_node_weight[MAX_THREADS]; // Adjust size according to the maximum number of threads
    __shared__ double shared_sum_weight_result[MAX_THREADS];

    if (x < nhub) {
        int nid = hub[x];
        shared_node_weight[threadIdx.x] = node_weight[nid];
        shared_sum_weight_result[threadIdx.x] = sum_weight_result[nid];
        __syncthreads();
        
        for (int eid = neighbor_start[nid]; eid < neighbor_start[nid+1]; eid++) {
            int remote_node = neighbor[eid];
            
            // Use shared memory values
            double move_prob = batch_fraction * shared_node_weight[threadIdx.x] / shared_sum_weight_result[threadIdx.x];
            
            int move_rat = rat_count[nid] * move_prob;
            int move_healthy = healthy_rat_count[nid] * move_prob;
            int move_exposed = exposed_rat_count[nid] * move_prob;
            int move_infectious = infectious_rat_count[nid] * move_prob;
            
            atomicAdd(&rat_count[remote_node], move_rat);
            atomicAdd(&healthy_rat_count[remote_node], move_healthy);
            atomicAdd(&exposed_rat_count[remote_node], move_exposed);
            atomicAdd(&infectious_rat_count[remote_node], move_infectious);

            rat_count[nid] -= move_rat;
            healthy_rat_count[nid] -= move_healthy;
            exposed_rat_count[nid] -= move_exposed;
            infectious_rat_count[nid] -= move_infectious;
        }
    }
}