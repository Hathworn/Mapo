#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void logprobs_kernel(double * corect_logprobs, double * probs, int* y, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute unique thread index
    if (i < size) { // Ensure index is within bounds
        corect_logprobs[i] = -log(probs[i * size + y[i]]); // Compute logprob
    }
}