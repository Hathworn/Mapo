#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define NUM_THREADS_PER_BLOCK 512

int* create_shifts (char* pattern);

int linear_horspool_match (char* text, char* pattern, int* shift_table, unsigned int* num_matches, int chunk_size,
int num_chunks, int text_size, int pat_len, int myId);

// Optimized global kernel function
__global__ void horspool_match (char* text, char* pattern, int* shift_table, unsigned int* num_matches, int chunk_size, int num_chunks, int text_size, int pat_len) {
    const int TABLE_SIZ = 126;

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    if(myId >= num_chunks) { // Check for valid thread
        return;
    }

    int count = 0;
    int text_start = myId * chunk_size;
    int text_end = text_start + chunk_size + pat_len - 1;

    int i = text_start + pat_len - 1; // Initialize index

    while(i < text_end && i < text_size) {
        int k = 0;
        if (text[i] >= TABLE_SIZ || text[i] < 0) {
            // Skip unknown character
            ++i;
            continue;
        }
        
        while(k < pat_len && pattern[pat_len - 1 - k] == text[i - k]) {
            ++k; // Count matched characters
        }

        if(k == pat_len) {
            ++count; // Pattern found
            ++i; // Move to next character
        } else {
            // Shift index using table
            i += shift_table[text[i]];
        }
    }

    atomicAdd(num_matches, count);
}