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

    // Optimize the selection sort loop
    __shared__ float shared_dist[1024]; // Use shared memory to accelerate access
    __shared__ int shared_outi[1024];

    for (int j = index; j < m; j += stride) {
        if (threadIdx.x < n) {
            shared_dist[threadIdx.x] = out[j * n + threadIdx.x];
            shared_outi[threadIdx.x] = outi[j * n + threadIdx.x];
        }
        __syncthreads();

        // Improved selection sort for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (shared_dist[t] < shared_dist[min]) {
                    min = t;
                }
            }
            if (min != s) {
                float temp = shared_dist[min];
                shared_dist[min] = shared_dist[s];
                shared_dist[s] = temp;
                int temp_i = shared_outi[min];
                shared_outi[min] = shared_outi[s];
                shared_outi[s] = temp_i;
            }
        }

        if (threadIdx.x < n) {
            out[j * n + threadIdx.x] = shared_dist[threadIdx.x];
            outi[j * n + threadIdx.x] = shared_outi[threadIdx.x];
        }
        __syncthreads();
    }
}