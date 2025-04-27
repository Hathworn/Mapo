#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef _KERNEL_H
#define _KERNEL_H
typedef struct Node {
    int starting;
    int no_of_edges;
} Node;

#endif

__global__ void test1(bool* d_graph_visited, int no_of_nodes) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Check and update using a single operation to reduce memory writes
    if (tid < no_of_nodes && !d_graph_visited[tid]) {
        d_graph_visited[tid] = true;
    }
}