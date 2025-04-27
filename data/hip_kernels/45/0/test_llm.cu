#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef _KERNEL_H
#define _KERNEL_H
typedef struct Node {
    int starting;
    int no_of_edges;
} Node;

#endif

__global__ void test(Node* d_graph_nodes, int no_of_nodes) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < no_of_nodes) {
        // Use shared memory to minimize global memory access
        extern __shared__ Node shared_nodes[];
        Node temp_node = d_graph_nodes[tid];
        temp_node.starting += 1;
        shared_nodes[threadIdx.x] = temp_node;
        
        // Ensure all threads have written to shared memory
        __syncthreads();
        
        // Write back to global memory
        d_graph_nodes[tid] = shared_nodes[threadIdx.x];
    }
}