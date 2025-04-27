#include "hip/hip_runtime.h"
#include "includes.h"

/* Program Parameters */
#define MAXN 15000  /* Max value of N */
#define TILE_WIDTH 32  /* Width of each block */
int N;  /* Matrix size */

/* Matrices */
float overall;
char buffer[10000];
char *pbuff;
int *classIdArray = (int *)malloc(sizeof(int)*26);
int *groupIdArray = (int *)malloc(sizeof(int)*26);
int *roomIdArray =(int *) malloc(sizeof(int)*26);
int *roomSizeAsArray = (int *)malloc(sizeof(int)*5);
int *groupSizeAsArray = (int *)malloc(sizeof(int)*11);
int *timeSlotIdArray = (int *)malloc(sizeof(int)*26);
int *profIdArray = (int *)malloc(sizeof(int)*26);
int *clashes=(int *)calloc(26*26,sizeof(int));

int   *dclassIdArray,*dgroupIdArray,*droomIdArray,*droomSizeAsArray,*dgroupSizeAsArray,*dtimeSlotIdArray,*dprofIdArray,*dclashes;

/* junk */
#define randm() 4|2[uid]&3

/* optimized kernel function */
__global__ void calculateFitness(int *classIds, int *roomIds, int *roomCapacities, int *groupIds, int *groupSizes, int *timeSlotIds, int *profIds, int *clashes)
{
    int i = threadIdx.x;
    int j = blockIdx.x;

    // Cache frequently accessed values
    int classId_i = classIds[i];
    int roomCapacity_i = roomCapacities[classId_i];
    int groupId_i = groupIds[classId_i];
    int groupSize_i = groupSizes[groupId_i];
    
    // Check for room capacity and group size
    if(classId_i == classIds[j] && roomCapacity_i < groupSize_i) {
        atomicAdd(&clashes[i*j+i], 1);  // Use atomic operation
    }
    
    // Cache shared variables to minimize global memory access
    int classId_j = classIds[j];
    int roomId_i = roomIds[classId_i];
    int roomId_j = roomIds[classId_j];
    int timeSlotId_i = timeSlotIds[classId_i];
    int timeSlotId_j = timeSlotIds[classId_j];
    int profId_j = profIds[classId_j];
    
    // Check for room and time slot conflicts
    if (roomId_i == roomId_j && timeSlotId_i == timeSlotId_j && classId_i != classId_j) {
        atomicAdd(&clashes[i*j+i], 1);  // Use atomic operation
    }
    
    // Check for professor and time slot conflicts
    if (profId_j == profIds[classId_j] && timeSlotId_i == timeSlotId_j && classId_i != classId_j) {
        atomicAdd(&clashes[i*j+i], 1);  // Use atomic operation
    }
}