#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ac_kernel1 ( int *d_state_transition, unsigned int *d_state_supply, unsigned int *d_state_final, unsigned char *d_text, unsigned int *d_out, size_t pitch, int m, int n, int p_size, int alphabet, int numBlocks ) {

    // Calculate effective pitch
    int effective_pitch = pitch / sizeof(int);
    
    // Calculate characters per block and thread
    int charactersPerBlock = (n + numBlocks - 1) / numBlocks; // Use ceiling division
    int charactersPerThread = (charactersPerBlock + blockDim.x - 1) / blockDim.x; // Use ceiling division

    // Determine start and stop indices
    int startBlock = blockIdx.x * charactersPerBlock;
    int stopBlock = min(startBlock + charactersPerBlock, n); // Clamp to n
    int startThread = startBlock + charactersPerThread * threadIdx.x;
    int stopThread = min(startThread + charactersPerThread + m - 1, n); // Clamp to n

    int r = 0, s;
    int column;

    for ( column = startThread; column < stopThread; column++ ) {
        while ( ( s = d_state_transition[r * effective_pitch + (d_text[column] - (unsigned char)'A')] ) == -1 )
            r = d_state_supply[r];
        r = s;
        d_out[column] = d_state_final[r];
    }
}