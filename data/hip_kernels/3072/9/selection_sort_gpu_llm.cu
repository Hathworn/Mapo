#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Copy from dist to out, outi in parallel
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
        }
    }

    __syncthreads(); // Ensure all threads complete the copy before sorting

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = out + j * n;
        // Optimized selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            float min_val = p_dist[s];
            // Find the min more efficiently
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < min_val) {
                    min = t;
                    min_val = p_dist[t];
                }
            }
            // Swap if needed
            if (min != s) {
                p_dist[min] = p_dist[s];
                p_dist[s] = min_val;
                int tmpi = outi[j * n + min];
                outi[j * n + min] = outi[j * n + s];
                outi[j * n + s] = tmpi;
            }
        }
    }
}