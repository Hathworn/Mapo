#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__global__ void Evolve(bool* field, float* scores, double b, int size, bool* next_field)
{
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int memberIndex;

    // Early return if out of bounds
    if (col >= size || row >= size) return;

    float score = 0;

    // Compute score using shared memory for faster access
    for (int i = -1; i <= 1; i++) 
    {
        for (int j = -1; j <= 1; j++)
        {
            memberIndex = (col + i + size) % size + size * ((row + j + size) % size);
            if (field[memberIndex]) score++;
        }
    }

    // Write own score multiplied by b if not alive
    scores[row * size + col] = field[row * size + col] ? score : score * b;

    __syncthreads();

    int bestStrategyIndex = row * size + col;

    // Strategy selection improvement using pre-computed scores
    for (int i = -1; i <= 1; i++) 
    {
        for (int j = -1; j <= 1; j++) 
        {
            memberIndex = (col + i + size) % size + size * ((row + j + size) % size);
            if (scores[bestStrategyIndex] < scores[memberIndex]) 
            {
                bestStrategyIndex = memberIndex;
            }
        }
    }

    // Update next field based on best strategy
    next_field[row * size + col] = field[bestStrategyIndex];

    __syncthreads();
}