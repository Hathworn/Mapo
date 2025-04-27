#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuInsertionSort(float *dist, long *ind, int width, int height, int k){

    // Thread index in the x dimension
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform sorting only if within valid range
    if (xIndex < width) {

        // Initialize pointers and the max distance value
        float *p_dist = dist + xIndex;
        long  *p_ind = ind + xIndex;
        float max_dist = p_dist[0];
        p_ind[0] = 1;

        // Sort the first k elements
        for (int l = 1; l < k; l++) {
            long curr_row = l * width;
            float curr_dist = p_dist[curr_row];
            if (curr_dist < max_dist) {
                int i = l - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    i--;
                }
                i++; // Find insertion position
                for (int j = l; j > i; j--) {
                    // Shift elements to the right
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                // Insert current distance and update index
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;
            } else {
                p_ind[l * width] = l + 1;
            }
            max_dist = p_dist[curr_row]; // Update max distance
        }

        // Insert subsequent elements into the first k positions
        for (int l = k; l < height; l++) {
            float curr_dist = p_dist[l * width];
            if (curr_dist < max_dist) {
                int i = k - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    i--;
                }
                i++; // Find insertion position
                for (int j = k - 1; j > i; j--) {
                    // Shift elements to the right
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                // Insert current distance and update index
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;
                max_dist = p_dist[(k - 1) * width]; // Update max distance
            }
        }
    }
}