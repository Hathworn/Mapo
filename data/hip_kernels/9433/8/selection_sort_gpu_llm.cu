#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Copy from dist to dist_out
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
        }
    }

    __shared__ float shared_out[1024]; // Use shared memory for faster access

    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            int global_idx = j * n + s;
            if (s < 1024) shared_out[s] = out[global_idx]; // Load data to shared memory
        }
        __syncthreads();

        float* p_dist = j % (blockDim.x / stride) == 0 ? shared_out : out + j * n; // Decide on using shared/global depending on size
        // Selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            // Find the min
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            // Swap min-th and i-th element
            if (min != s) {
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
```
