#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Each thread will process multiple elements in a stride loop
    for (int j = index; j < m; j += stride) {
        float *p_dist = dist + j * n;

        // selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;

            // find the min using a more compact for loop
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            // update idx and val
            idx[j * k + s] = min;  // Simplified address calculation.
            val[j * k + s] = p_dist[min];

            // swap min-th and s-th element
            float tmp = p_dist[min];
            p_dist[min] = p_dist[s];
            p_dist[s] = tmp;
        }
    }
}