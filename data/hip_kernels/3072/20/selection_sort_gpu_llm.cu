#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    float *p_dist;
    // Loop unrolling for improved performance
    for (int j = index; j + 4 <= m; j += stride * 4) {
        for (int offset = 0; offset < 4; ++offset) {
            int current_j = j + offset;
            if (current_j < m) {
                p_dist = dist + current_j * n;
                for (int s = 0; s < k; ++s) {
                    int min = s;
                    for (int t = s + 1; t < n; ++t) {
                        if (p_dist[t] < p_dist[min]) {
                            min = t;
                        }
                    }
                    idx[current_j * n + s] = min;
                    val[current_j * n + s] = p_dist[min];
                    float tmp = p_dist[min];
                    p_dist[min] = p_dist[s];
                    p_dist[s] = tmp;
                }
            }
        }
    }
    // Handle remaining elements when m is not a multiple of 4
    for (int j = index + (m / stride) * stride; j < m; j += stride) {
        p_dist = dist + j * n;
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            idx[j * n + s] = min;
            val[j * n + s] = p_dist[min];
            float tmp = p_dist[min];
            p_dist[min] = p_dist[s];
            p_dist[s] = tmp;
        }
    }
}