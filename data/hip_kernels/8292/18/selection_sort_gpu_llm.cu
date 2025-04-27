#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Improved memory coalescing
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
        }
    }

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = out + j * n;
        // Optimized loop tiling for better cache usage
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            if (min != s) {
                // Swap elements efficiently
                float tmp = p_dist[min];
                p_dist[min] = p_dist[s];
                p_dist[s] = tmp;
                int tmpi = outi[j * n + min];
                outi[j * n + min] = outi[j * n + s];
                outi[j * n + s] = tmpi;
            }
        }
    }
}