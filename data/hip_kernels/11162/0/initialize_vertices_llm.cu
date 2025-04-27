#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void initialize_vertices(int *vertices, int starting_vertex) {
    int v = blockDim.x * blockIdx.x + threadIdx.x;
    if (v < SIZ) { // Ensure within bounds
        vertices[v] = (v == starting_vertex) ? 0 : -1; // Use ternary operator for compactness
    }
}