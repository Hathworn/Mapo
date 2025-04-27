#include "hip/hip_runtime.h"
#include "includes.h"

#define N 30
#define TRUE 1
#define FALSE 0
#define MAX_BLOCKS 65000

int cuda_setup(int computeCapability);

typedef struct {
    int id;
    int age;
    int height;
} Person;

__global__ void analyze_age(Person *people, int *statResults) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if thread id is within bounds before accessing memory
    if (id < N) {
        Person person = people[id];
        
        // Use ternary operator for simplicity
        statResults[id] = (person.age != 28) ? 1 : 0;
    }
}