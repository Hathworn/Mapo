#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Efficient copying using shared memory
    extern __shared__ float shared_dist[];
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
            shared_dist[j * n + s] = out[j * n + s];
        }
    }
    __syncthreads();

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = shared_dist + j * n;
        // Optimize selection sort by reducing if-statement overhead
        for (int s = 0; s < k; ++s) {
            int min = s;
            float min_val = p_dist[s];
            // Unroll loop for small performance gain
            #pragma unroll
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < min_val) {
                    min = t;
                    min_val = p_dist[t];
                }
            }
            // Avoid swap if unnecessary
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