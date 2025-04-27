#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16
#define HUB_BLOCK_SIZE 32

#define TRANSITION_PROB 0.02 * 0.1

__global__ void next_move_kernel(int *rat_count, int *healthy_rat_count, int *exposed_rat_count, int *infectious_rat_count, double *node_weight, double *sum_weight_result, int *neighbor, int *neighbor_start, int width, int height, double batch_fraction) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int nid = y * width + x;

    // Ensure computations are only performed within valid bounds
    if (x < width && y < height) {
        double node_weight_val = node_weight[nid];
        double sum_weight_result_val = sum_weight_result[nid];
        int rat_count_val = rat_count[nid];
        int healthy_rat_count_val = healthy_rat_count[nid];
        int exposed_rat_count_val = exposed_rat_count[nid];
        int infectious_rat_count_val = infectious_rat_count[nid];

        // Precompute move probabilities
        double batch_fraction_sum_weight = batch_fraction / sum_weight_result_val;

        for (int eid = neighbor_start[nid]; eid < neighbor_start[nid + 1]; eid++) {
            int remote_node = neighbor[eid];

            // Optimize memory access by using shared variables
            double move_prob = node_weight[remote_node] * batch_fraction_sum_weight;
            int move_rat = rat_count_val * move_prob;
            int move_healthy = healthy_rat_count_val * move_prob;
            int move_exposed = exposed_rat_count_val * move_prob;
            int move_infectious = infectious_rat_count_val * move_prob;

            // Use atomic operations to update neighbor counts
            atomicAdd(&rat_count[remote_node], move_rat);
            atomicAdd(&healthy_rat_count[remote_node], move_healthy);
            atomicAdd(&exposed_rat_count[remote_node], move_exposed);
            atomicAdd(&infectious_rat_count[remote_node], move_infectious);

            // Update current node counts
            rat_count_val -= move_rat;
            healthy_rat_count_val -= move_healthy;
            exposed_rat_count_val -= move_exposed;
            infectious_rat_count_val -= move_infectious;
        }

        // Write back the updated values
        rat_count[nid] = rat_count_val;
        healthy_rat_count[nid] = healthy_rat_count_val;
        exposed_rat_count[nid] = exposed_rat_count_val;
        infectious_rat_count[nid] = infectious_rat_count_val;
    }
}