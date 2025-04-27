#include "hip/hip_runtime.h"
#include "includes.h"

#define max(a, b) a > b ? a : b
#define min(a, b) a < b ? a : b

struct Edge{
    long long int x;
};

__global__ void initialize_parent(int* parent, int n){
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional statement to ensure accessing valid indices
    if(id < n){
        parent[id] = id;
    }
}