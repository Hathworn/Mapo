#include "hip/hip_runtime.h"
#include "includes.h"

#define N 30
#define TRUE 1
#define FALSE 0
#define MAX_BLOCKS 65000

typedef struct {
    int id;
    int age;
    int height;
} Person;

__global__ void analyze_height(Person *people, int *statResults)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (id < N) {
        // Use shared memory for data reuse (if needed, declaration omitted for simplicity)
        Person person = people[id]; // Load person data from global memory
        
        // Simplified condition check
        statResults[id] = (person.height != 6) ? 1 : 0;
    }
}