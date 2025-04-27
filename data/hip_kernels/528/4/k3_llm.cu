#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k3(const int N, int* augPath, bool* visited, int* frontier, bool* new_frontier, bool* par_mat, int* cap_mat, bool* adj_mat, int* cap_max_mat, int* maxflow, bool* augFound) {
    augFound[0] = false;

    // Optimized path finding with while loop
    augPath[0] = N - 1;
    int i = 1, vertex = N - 1;
    while (vertex != 0) {
        int found = 0;
        for (int j = 0; j < N && !found; j++) {
            if (par_mat[vertex * N + j]) {
                vertex = j;
                augPath[i] = vertex;
                i++;
                found = 1;
            }
        }
    }

    // Computing bottleneck more effectively
    int bottleneck = INT_MAX;
    for (int i = 0; augPath[i] != 0 && i < N - 1; i++) {
        int k = augPath[i];
        int j = augPath[i + 1];
        int freeCap = adj_mat[j * N + k] ? (cap_max_mat[j * N + k] - cap_mat[j * N + k]) : cap_mat[k * N + j];
        bottleneck = min(bottleneck, freeCap);
    }
    maxflow[0] += bottleneck;

    // Update capacities based on the bottleneck
    for (int i = 0; augPath[i] != 0 && i < N - 1; i++) {
        int k = augPath[i];
        int j = augPath[i + 1];
        if (adj_mat[j * N + k]) {
            cap_mat[j * N + k] += bottleneck;
        } else {
            cap_mat[k * N + j] -= bottleneck;
        }
    }

    // Initialize matrices and vectors
    for (int i = 0; i < N * N; i++) par_mat[i] = false;
    for (int i = 0; i < N; i++) visited[i] = false;
    for (int i = 0; i < N; i++) new_frontier[i] = false;

    visited[0] = true;
    frontier[0] = 1;
    frontier[1] = 0;
}