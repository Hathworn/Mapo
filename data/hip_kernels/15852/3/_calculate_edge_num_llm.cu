#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _calculate_edge_num(long* edge_num, const long* edge_num_sum, const long* edge_idx_sort, const int b, const int n, const int orig_p_num, const long p_num) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= b * n) return;

    const int c_b = index / n;
    const int c_n = index % n;

    long* c_edge_num = &edge_num[c_b * n * orig_p_num + c_n * orig_p_num];
    const long c_edge_num_sum = edge_num_sum[c_b * n + c_n];
    const long* c_edge_idx_sort = &edge_idx_sort[c_b * n * orig_p_num + c_n * orig_p_num];

    if (c_edge_num_sum == p_num) return;

    long diff = p_num - c_edge_num_sum;
    if (diff > 0) {
        // Directly adjust the first sorted edge
        c_edge_num[c_edge_idx_sort[0]] += diff;
    } else {
        // Handle excess edges efficiently
        int id = 0;
        long excess = -diff;
        while (excess > 0) {
            long edge_idx = c_edge_idx_sort[id];
            long decrement = min(excess, c_edge_num[edge_idx] - 1);
            c_edge_num[edge_idx] -= decrement;
            excess -= decrement;
            id++;
        }
    }
}