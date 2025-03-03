; ModuleID = '../data/hip_kernels/16057/5/main.cu'
source_filename = "../data/hip_kernels/16057/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19glcm_calculation_45PiS_iii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = add i32 %13, %6
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !5, !invariant.load !6
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = add i32 %21, %15
  %23 = mul nsw i32 %22, %2
  %24 = add nsw i32 %14, %23
  %25 = icmp sgt i32 %2, 1
  br i1 %25, label %26, label %116

26:                                               ; preds = %5
  %27 = zext i32 %24 to i64
  %28 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %27
  %29 = sub nsw i32 1, %2
  %30 = add i32 %29, %24
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = add nuw nsw i32 %7, 1
  %34 = mul nsw i32 %33, %2
  %35 = add nsw i32 %34, -1
  %36 = icmp uge i32 %24, %35
  %37 = add i32 %2, -1
  %38 = add i32 %2, -2
  %39 = and i32 %37, 3
  %40 = icmp ult i32 %38, 3
  br i1 %40, label %96, label %41

41:                                               ; preds = %26
  %42 = and i32 %37, -4
  br label %43

43:                                               ; preds = %92, %41
  %44 = phi i32 [ 1, %41 ], [ %93, %92 ]
  %45 = phi i32 [ 0, %41 ], [ %94, %92 ]
  %46 = icmp ne i32 %7, %44
  %47 = select i1 %46, i1 true, i1 %36
  br i1 %47, label %56, label %48

48:                                               ; preds = %43
  %49 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %50 = mul nsw i32 %49, %4
  %51 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %52 = add nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = atomicrmw add i32 addrspace(1)* %54, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %43, %48
  %57 = add nuw nsw i32 %44, 1
  %58 = icmp ne i32 %7, %57
  %59 = select i1 %58, i1 true, i1 %36
  br i1 %59, label %68, label %60

60:                                               ; preds = %56
  %61 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %62 = mul nsw i32 %61, %4
  %63 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  %67 = atomicrmw add i32 addrspace(1)* %66, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %68

68:                                               ; preds = %60, %56
  %69 = add nuw nsw i32 %44, 2
  %70 = icmp ne i32 %7, %69
  %71 = select i1 %70, i1 true, i1 %36
  br i1 %71, label %80, label %72

72:                                               ; preds = %68
  %73 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %74 = mul nsw i32 %73, %4
  %75 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %76 = add nsw i32 %74, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  %79 = atomicrmw add i32 addrspace(1)* %78, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %80

80:                                               ; preds = %72, %68
  %81 = add nuw nsw i32 %44, 3
  %82 = icmp ne i32 %7, %81
  %83 = select i1 %82, i1 true, i1 %36
  br i1 %83, label %92, label %84

84:                                               ; preds = %80
  %85 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %86 = mul nsw i32 %85, %4
  %87 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %88 = add nsw i32 %86, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  %91 = atomicrmw add i32 addrspace(1)* %90, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %92

92:                                               ; preds = %84, %80
  %93 = add nuw nsw i32 %44, 4
  %94 = add i32 %45, 4
  %95 = icmp eq i32 %94, %42
  br i1 %95, label %96, label %43, !llvm.loop !11

96:                                               ; preds = %92, %26
  %97 = phi i32 [ 1, %26 ], [ %93, %92 ]
  %98 = icmp eq i32 %39, 0
  br i1 %98, label %116, label %99

99:                                               ; preds = %96, %112
  %100 = phi i32 [ %113, %112 ], [ %97, %96 ]
  %101 = phi i32 [ %114, %112 ], [ 0, %96 ]
  %102 = icmp ne i32 %7, %100
  %103 = select i1 %102, i1 true, i1 %36
  br i1 %103, label %112, label %104

104:                                              ; preds = %99
  %105 = load i32, i32 addrspace(1)* %28, align 4, !tbaa !7
  %106 = mul nsw i32 %105, %4
  %107 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7
  %108 = add nsw i32 %106, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  %111 = atomicrmw add i32 addrspace(1)* %110, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %112

112:                                              ; preds = %104, %99
  %113 = add nuw nsw i32 %100, 1
  %114 = add i32 %101, 1
  %115 = icmp eq i32 %114, %39
  br i1 %115, label %116, label %99, !llvm.loop !13

116:                                              ; preds = %96, %112, %5
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}
