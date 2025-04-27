#include "hip/hip_runtime.h"
#include "includes.h"

#define V 8
#define E 11
#define MAX_WEIGHT 1000000
#define TRUE    1
#define FALSE   0

typedef int boolean;

// Represents an edge or path between Vertices
typedef struct
{
    int u;
    int v;
} Edge;

// Represents a Vertex
typedef struct
{
    int title;
    boolean visited;
} Vertex;

// Updates the paths for each vertex
__global__ void Update_Paths(Vertex *vertices, int *length, int *updateLength)
{
    int u = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique thread index
    if (u < V)  // Ensure we don't exceed the number of vertices
    {
        if (length[u] > updateLength[u])
        {
            length[u] = updateLength[u];
            vertices[u].visited = FALSE;
        }
        updateLength[u] = length[u];
    }
}