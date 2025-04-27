#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuInsertionSort(float *dist, long *ind, int width, int height, int k) {
    // Optimize variable usage
    int i, j;
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {
        // Use shared memory to reduce global memory access
        extern __shared__ float s_dist[];
        extern __shared__ long s_ind[];

        // Initialize and copy global to shared memory
        float max_dist = dist[xIndex];
        s_dist[0] = max_dist;
        s_ind[0] = 1;

        // Part 1: Sort first k elements
        for (int l = 1; l < k; l++) {
            float curr_dist = dist[l * width + xIndex];
            long curr_row = l * width + xIndex;

            if (curr_dist < max_dist) {
                i = l - 1;
                for (int a = 0; a < l - 1; a++) {
                    if (s_dist[a] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                // Optimize shift operation using shared memory
                for (j = l; j > i; j--) {
                    s_dist[j] = s_dist[j - 1];
                    s_ind[j] = s_ind[j - 1];
                }
                s_dist[i] = curr_dist;
                s_ind[i] = l + 1;
            } else {
                s_ind[l] = l + 1;
            }
            max_dist = s_dist[l];
        }

        // Copy sorted results back to global memory for first k items
        for (j = 0; j < k; j++) {
            dist[j * width + xIndex] = s_dist[j];
            ind[j * width + xIndex] = s_ind[j];
        }

        // Part 2: Insert elements in the k-th first lines
        float max_row = s_dist[k - 1];
        for (int l = k; l < height; l++) {
            float curr_dist = dist[l * width + xIndex];

            if (curr_dist < max_row) {
                i = k - 1;
                for (int a = 0; a < k - 1; a++) {
                    if (s_dist[a] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                // Optimize shift operation using shared memory
                for (j = k - 1; j > i; j--) {
                    s_dist[j] = s_dist[j - 1];
                    s_ind[j] = s_ind[j - 1];
                }
                s_dist[i] = curr_dist;
                s_ind[i] = l + 1;

                max_row = s_dist[k - 1];
            }
        }

        // Copy sorted results back to global memory for entire height
        for (j = 0; j < k; j++) {
            dist[j * width + xIndex] = s_dist[j];
            ind[j * width + xIndex] = s_ind[j];
        }
    }
}