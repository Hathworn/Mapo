#include "hip/hip_runtime.h"
#include "includes.h"

/*
cudaStructTest
testing/optimizing how to access/manipulate/return
structures in cuda.
*/

#define N 30
#define TRUE 1
#define FALSE 0
#define MAX_BLOCKS 65000

typedef struct{
    int id;
    int age;
    int height;
} Person;

// Optimize analyze_height kernel
__global__ void analyze_height(Person *people, int *statResults)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (id < N) {
        // Access person directly without a temporary variable
        statResults[id] = (people[id].height != 6) ? 1 : 0;
    }
}