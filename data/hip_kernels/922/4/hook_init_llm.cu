#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void hook_init(int* parent, Edge* edge_list, int e){
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds and avoid shared variables
    if(id < e){
        long long int x = edge_list[id].x;
        int v = (int) x & 0xFFFFFFFF;
        int u = (int) (x >> 32);

        // Directly calculate min and max using ternary operator
        int mx = u > v ? u : v;
        int mn = u <= v ? u : v;
        
        parent[mx] = mn;
    }
}