#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZ 20
#define num_inp 4

using namespace std;

typedef struct edge {
    int first, second;
} edges;

__global__ void bfs(const edge *edges, int *vertices, int current_depth) {
    int a = blockDim.x * blockIdx.x + threadIdx.x;
    if (a >= SIZ) return; // Ensure thread index doesn't exceed bounds

    int vfirst = edges[a].first;
    int dfirst = vertices[vfirst];
    int vsecond = edges[a].second;
    int dsecond = vertices[vsecond];

    // Coalesced memory accesses for vertices
    if ((dfirst == current_depth) && (dsecond == -1)) {
        vertices[vsecond] = dfirst + 1;
    }
    else if ((dfirst == -1) && (dsecond == current_depth)) {
        vertices[vfirst] = dsecond + 1;
    }
}