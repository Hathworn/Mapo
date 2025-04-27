#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

struct compressed_sparse_column {
    int* data;
    int* row;
    int* column;
    int* index_column;
    int* index_row_start;
    int* index_row_end;
};

struct graph {
    compressed_sparse_column* dataset;
    bool* roots;
    bool* leaves;
    bool* singletons;
    int vertices;
    int edges;
};

__global__ void pre_post_order(int* depth, int* zeta, int* zeta_tilde, graph* dataset_graph) {
    extern __shared__ bool shared_memory[]; // Shared memory allocation
    int* pre = reinterpret_cast<int*>(shared_memory);
    int* post = pre + dataset_graph->vertices;
    bool* incoming_edges = reinterpret_cast<bool*>(post + dataset_graph->vertices);
    bool* q = reinterpret_cast<bool*>(incoming_edges + dataset_graph->edges);
    bool* p = reinterpret_cast<bool*>(q + dataset_graph->vertices);

    int tid = threadIdx.x;

    if (tid < dataset_graph->vertices) {
        pre[tid] = 0;
        post[tid] = 0;
        q[tid] = dataset_graph->roots[tid];
        p[tid] = false;
    }
    if (tid < dataset_graph->edges) {
        incoming_edges[tid] = false;
    }

    __syncthreads(); // Synchronize threads after initializing shared memory

    while (true) {
        bool global_check = false;

        for (int i = tid; i < dataset_graph->vertices; i += blockDim.x) {
            if (q[i]) {
                int pre_node = pre[i];
                int post_node = post[i];

                for (int j = dataset_graph->dataset->index_column[i];
                     dataset_graph->dataset->column[j] == i; j++) {
                    int neighbor_vertex = dataset_graph->dataset->row[j];

                    pre[neighbor_vertex] = pre_node + zeta_tilde[neighbor_vertex];
                    post[neighbor_vertex] = post_node + zeta_tilde[neighbor_vertex];
                    incoming_edges[j] = true;

                    bool flag = true;
                    for (int k = 0; k < dataset_graph->edges; k++) {
                        if (dataset_graph->dataset->row[k] == neighbor_vertex && !incoming_edges[k]) {
                            flag = false;
                            break;
                        }
                    }
                    if (flag) {
                        global_check = true;
                        p[neighbor_vertex] = true;
                    }
                }
                pre[i] = pre_node + depth[i];
                post[i] = post_node + (zeta[i] - 1);
            }
        }

        __syncthreads(); // Synchronize threads before updating `q`

        if (tid < dataset_graph->vertices) {
            q[tid] = p[tid];
            p[tid] = false;
        }

        __syncthreads(); // Synchronize updated `q` across threads

        if (!global_check) {
            break;
        }
    }
}