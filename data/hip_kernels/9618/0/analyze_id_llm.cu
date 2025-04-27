#include "hip/hip_runtime.h"
#include "includes.h"

// Constants and Macro Definitions
#define N 30
#define TRUE 1
#define FALSE 0
#define MAX_BLOCKS 65000

// Struct Definition
typedef struct {
    int id;
    int age;
    int height;
} Person;

// Optimized global kernel function
__global__ void analyze_id(Person *people, int *statResults) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure only valid threads perform operations
    if (id < N) {
        statResults[id] = (people[id].id < 6) ? 1 : 0; // Directly assign result with condition
    }
}