; ModuleID = '../data/hip_kernels/14588/0/main.cu'
source_filename = "../data/hip_kernels/14588/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z15CycleRoutineGPUPcS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %124

15:                                               ; preds = %4
  %16 = add nsw i32 %13, %2
  %17 = icmp slt i32 %16, %3
  br i1 %17, label %18, label %23

18:                                               ; preds = %15
  %19 = sext i32 %16 to i64
  %20 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %19
  %21 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !7, !amdgpu.noclobber !5
  %22 = sext i8 %21 to i32
  br label %23

23:                                               ; preds = %18, %15
  %24 = phi i32 [ %22, %18 ], [ 0, %15 ]
  %25 = sub nsw i32 %13, %2
  %26 = icmp sgt i32 %25, -1
  br i1 %26, label %27, label %33

27:                                               ; preds = %23
  %28 = zext i32 %25 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !5
  %31 = sext i8 %30 to i32
  %32 = add nsw i32 %24, %31
  br label %33

33:                                               ; preds = %27, %23
  %34 = phi i32 [ %32, %27 ], [ %24, %23 ]
  %35 = sdiv i32 %13, %2
  %36 = add nsw i32 %13, 1
  %37 = sdiv i32 %36, %2
  %38 = icmp eq i32 %35, %37
  br i1 %38, label %39, label %45

39:                                               ; preds = %33
  %40 = sext i32 %36 to i64
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %40
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !7, !amdgpu.noclobber !5
  %43 = sext i8 %42 to i32
  %44 = add nsw i32 %34, %43
  br label %45

45:                                               ; preds = %39, %33
  %46 = phi i32 [ %44, %39 ], [ %34, %33 ]
  %47 = add nsw i32 %13, -1
  %48 = sdiv i32 %47, %2
  %49 = icmp eq i32 %35, %48
  br i1 %49, label %50, label %56

50:                                               ; preds = %45
  %51 = sext i32 %47 to i64
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %51
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !7, !amdgpu.noclobber !5
  %54 = sext i8 %53 to i32
  %55 = add nsw i32 %46, %54
  br label %56

56:                                               ; preds = %50, %45
  %57 = phi i32 [ %55, %50 ], [ %46, %45 ]
  br i1 %17, label %58, label %69

58:                                               ; preds = %56
  %59 = sdiv i32 %16, %2
  %60 = add nsw i32 %16, 1
  %61 = sdiv i32 %60, %2
  %62 = icmp eq i32 %59, %61
  br i1 %62, label %63, label %69

63:                                               ; preds = %58
  %64 = sext i32 %60 to i64
  %65 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %64
  %66 = load i8, i8 addrspace(1)* %65, align 1, !tbaa !7, !amdgpu.noclobber !5
  %67 = sext i8 %66 to i32
  %68 = add nsw i32 %57, %67
  br label %69

69:                                               ; preds = %63, %58, %56
  %70 = phi i32 [ %68, %63 ], [ %57, %58 ], [ %57, %56 ]
  br i1 %17, label %71, label %82

71:                                               ; preds = %69
  %72 = sdiv i32 %16, %2
  %73 = add nsw i32 %16, -1
  %74 = sdiv i32 %73, %2
  %75 = icmp eq i32 %72, %74
  br i1 %75, label %76, label %82

76:                                               ; preds = %71
  %77 = sext i32 %73 to i64
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %77
  %79 = load i8, i8 addrspace(1)* %78, align 1, !tbaa !7, !amdgpu.noclobber !5
  %80 = sext i8 %79 to i32
  %81 = add nsw i32 %70, %80
  br label %82

82:                                               ; preds = %76, %71, %69
  %83 = phi i32 [ %81, %76 ], [ %70, %71 ], [ %70, %69 ]
  br i1 %26, label %84, label %95

84:                                               ; preds = %82
  %85 = sdiv i32 %25, %2
  %86 = add nuw nsw i32 %25, 1
  %87 = sdiv i32 %86, %2
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %89, label %95

89:                                               ; preds = %84
  %90 = zext i32 %86 to i64
  %91 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %90
  %92 = load i8, i8 addrspace(1)* %91, align 1, !tbaa !7, !amdgpu.noclobber !5
  %93 = sext i8 %92 to i32
  %94 = add nsw i32 %83, %93
  br label %95

95:                                               ; preds = %89, %84, %82
  %96 = phi i32 [ %94, %89 ], [ %83, %84 ], [ %83, %82 ]
  br i1 %26, label %97, label %108

97:                                               ; preds = %95
  %98 = sdiv i32 %25, %2
  %99 = add nsw i32 %25, -1
  %100 = sdiv i32 %99, %2
  %101 = icmp eq i32 %98, %100
  br i1 %101, label %102, label %108

102:                                              ; preds = %97
  %103 = sext i32 %99 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %103
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !7, !amdgpu.noclobber !5
  %106 = sext i8 %105 to i32
  %107 = add nsw i32 %96, %106
  br label %108

108:                                              ; preds = %102, %97, %95
  %109 = phi i32 [ %107, %102 ], [ %96, %97 ], [ %96, %95 ]
  %110 = add nsw i32 %109, -4
  %111 = icmp ult i32 %110, -2
  br i1 %111, label %112, label %114

112:                                              ; preds = %108
  %113 = sext i32 %13 to i64
  br label %120

114:                                              ; preds = %108
  %115 = icmp eq i32 %109, 3
  %116 = sext i32 %13 to i64
  br i1 %115, label %120, label %117

117:                                              ; preds = %114
  %118 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %116
  %119 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !7, !amdgpu.noclobber !5
  br label %120

120:                                              ; preds = %114, %117, %112
  %121 = phi i64 [ %113, %112 ], [ %116, %117 ], [ %116, %114 ]
  %122 = phi i8 [ 0, %112 ], [ %119, %117 ], [ 1, %114 ]
  %123 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %121
  store i8 %122, i8 addrspace(1)* %123, align 1, !tbaa !7
  br label %124

124:                                              ; preds = %120, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
