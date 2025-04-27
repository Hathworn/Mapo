#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void next_move_kernel(bool *mask, int *rat_count, int *healthy_rat_count, int *exposed_rat_count, int *infectious_rat_count, double *node_weight, double *sum_weight_result, int *neighbor, int *neighbor_start, int width, int height, double batch_fraction) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x;

    if (x < width && y < height) {
        int start = neighbor_start[nid];
        int end = min(start + 5, neighbor_start[nid + 1]); // Limit to valid range

        double local_sum_weight_result = sum_weight_result[nid];
        int local_rat_count = rat_count[nid];
        int local_healthy_rat_count = healthy_rat_count[nid];
        int local_exposed_rat_count = exposed_rat_count[nid];
        int local_infectious_rat_count = infectious_rat_count[nid];

        // Loop unrolling for efficiency
        for (int eid = start; eid < end; eid++) {
            int remote_node = neighbor[eid];
            double node_weight_remote = node_weight[remote_node];
            double move_prob = batch_fraction * node_weight_remote / local_sum_weight_result;

            int move_rat = __double2int_rn(local_rat_count * move_prob);
            int move_healthy = __double2int_rn(local_healthy_rat_count * move_prob);
            int move_exposed = __double2int_rn(local_exposed_rat_count * move_prob);
            int move_infectious = __double2int_rn(local_infectious_rat_count * move_prob);

            atomicAdd(&rat_count[remote_node], move_rat);
            atomicAdd(&healthy_rat_count[remote_node], move_healthy);
            atomicAdd(&exposed_rat_count[remote_node], move_exposed);
            atomicAdd(&infectious_rat_count[remote_node], move_infectious);

            local_rat_count -= move_rat;
            local_healthy_rat_count -= move_healthy;
            local_exposed_rat_count -= move_exposed;
            local_infectious_rat_count -= move_infectious;
        }

        // Store back to global memory
        rat_count[nid] = local_rat_count;
        healthy_rat_count[nid] = local_healthy_rat_count;
        exposed_rat_count[nid] = local_exposed_rat_count;
        infectious_rat_count[nid] = local_infectious_rat_count;
    }
}