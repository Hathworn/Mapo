#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM 16

__global__ void cuInsertionSort(float *dist, long *ind, int width, int height, int k) {
    // Calculate the thread's xIndex
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {
        // Pointers to the distance and index arrays
        float *p_dist = dist + xIndex;
        long *p_ind = ind + xIndex;

        // Initialize the first index and max distance
        float max_dist = p_dist[0];
        p_ind[0] = 1;

        // Part 1: Sort the first k elements
        for (int l = 1; l < k; l++) {
            long curr_row = l * width;
            float curr_dist = p_dist[curr_row];
            
            if (curr_dist < max_dist) {
                int i = l - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    i--;
                }
                i++;

                // Shift elements to insert the current element
                for (int j = l; j > i; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;

                // Update max_dist
                max_dist = p_dist[(k - 1) * width];
            } else {
                p_ind[l * width] = l + 1;
            }
        }

        // Part 2: Continue sorting for rest of elements
        for (int l = k; l < height; l++) {
            float curr_dist = p_dist[l * width];
            
            if (curr_dist < max_dist) {
                int i = k - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    i--;
                }
                i++;

                // Shift elements to insert the current element
                for (int j = k - 1; j > i; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;

                // Update max_dist
                max_dist = p_dist[(k - 1) * width];
            }
        }
    }
}