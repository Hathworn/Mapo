#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int j = index; j < m; j += stride) {
        float *p_dist = dist + j * n;

        // Optimized selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            float min_val = p_dist[s];

            // Find the min
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < min_val) {
                    min = t;
                    min_val = p_dist[t];
                }
            }

            // Update idx and val
            idx[j * k + s] = min; // Adjusted to stride by k
            val[j * k + s] = min_val;

            // Swap min-th and s-th element
            p_dist[min] = p_dist[s];
            p_dist[s] = min_val; // Use min_val directly
        }
    }
}